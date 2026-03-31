#!/bin/bash

# If a command fails, make the whole script exit
set -e
# Use return code for any command errors in part of a pipe
set -o pipefail # Bashism

# Kali's default values
ZYPHOR_DIST="zyphor"
ZYPHOR_VERSION=""
ZYPHOR_VARIANT="default"
TARGET_DIR="$(dirname $0)/images"
TARGET_SUBDIR=""
SUDO="sudo"
VERBOSE=""
DEBUG=""
HOST_ARCH=$(dpkg --print-architecture)

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

image_name() {
  case "$ZYPHOR_ARCH" in
    i386|amd64|arm64)
      echo "live-image-$ZYPHOR_ARCH.hybrid.iso"
    ;;
    armhf)
      echo "live-image-$ZYPHOR_ARCH.img"
    ;;
  esac
}

target_image_name() {
  local arch=$1

  IMAGE_NAME="$(image_name $arch)"
  IMAGE_EXT="${IMAGE_NAME##*.}"
  if [ "$IMAGE_EXT" = "$IMAGE_NAME" ]; then
    IMAGE_EXT="img"
  fi
  if [ "$ZYPHOR_VARIANT" = "default" ]; then
    echo "${TARGET_SUBDIR:+$TARGET_SUBDIR/}kali-linux-$ZYPHOR_VERSION-live-$ZYPHOR_ARCH.$IMAGE_EXT"
  else
    echo "${TARGET_SUBDIR:+$TARGET_SUBDIR/}kali-linux-$ZYPHOR_VERSION-live-$ZYPHOR_VARIANT-$ZYPHOR_ARCH.$IMAGE_EXT"
  fi
}

target_build_log() {
  TARGET_IMAGE_NAME=$(target_image_name $1)
  echo ${TARGET_IMAGE_NAME%.*}.log
}

default_version() {
  case "$1" in
    kali-*)
      echo "${1#kali-}"
    ;;
    *)
      echo "$1"
    ;;
  esac
}

failure() {
  echo "Build of $ZYPHOR_DIST/$ZYPHOR_VARIANT/$ZYPHOR_ARCH live image failed (see build.log for details)" >&2
  echo "Log: $BUILD_LOG" >&2
  exit 2
}

run_and_log() {
  if [ -n "$VERBOSE" ] || [ -n "$DEBUG" ]; then
    printf "RUNNING:" >&2
    for _ in "$@"; do
      [[ $_ =~ [[:space:]] ]] && printf " '%s'" "$_" || printf " %s" "$_"
    done >&2
    printf "\n" >&2
    "$@" 2>&1 | tee -a "$BUILD_LOG"
  else
    "$@" >>"$BUILD_LOG" 2>&1
  fi
  return $?
}

debug() {
  if [ -n "$DEBUG" ]; then
    echo "DEBUG: $*" >&2
  fi
}

clean() {
  debug "Cleaning"

  run_and_log $SUDO lb clean --purge # ./auto/clean
  #run_and_log $SUDO umount -l $(pwd)/chroot/proc
  #run_and_log $SUDO umount -l $(pwd)/chroot/dev/pts
  #run_and_log $SUDO umount -l $(pwd)/chroot/sys
  #run_and_log $SUDO rm -rf $(pwd)/chroot
  #run_and_log $SUDO rm -rf $(pwd)/binary
}

print_help() {
  echo "Usage: $0 [<option>...]"
  echo
  for x in $(echo "${BUILD_OPTS_LONG}" | sed 's_,_ _g'); do
    x=$(echo $x | sed 's/:$/ <arg>/')
    echo "  --${x}"
  done
  echo
  echo "More information: https://www.kali.org/docs/development/live-build-a-custom-kali-iso/"
  exit 0
}

require_package() {
  local pkg=$1
  local required_version=$2
  local pkg_version=

  pkg_version=$(dpkg-query -f '${Version}' -W $pkg 2>/dev/null || true)
  if [ -z "$pkg_version" ]; then
    echo "ERROR: You need $pkg, but it is not installed" >&2
    exit 1
  fi
  if dpkg --compare-versions "$pkg_version" lt "$required_version"; then
    echo "ERROR: You need $pkg (>= $required_version), you have $pkg_version" >&2
    exit 1
  fi
  debug "$pkg version: $pkg_version"
}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Change directory into where the script is
cd $(dirname $0)/

# Allowed command line options
source .getopt.sh

# Parsing command line options (see .getopt.sh)
temp=$(getopt -o "$BUILD_OPTS_SHORT" -l "$BUILD_OPTS_LONG" -- "$@")
eval set -- "$temp"
while true; do
  case "$1" in
    -d|--distribution) ZYPHOR_DIST="$2"; shift 2; ;;
    -p|--proposed-updates) OPT_pu="1"; shift 1; ;;
    -a|--arch) ZYPHOR_ARCH="$2"; shift 2; ;;
    -v|--verbose) VERBOSE="1"; shift 1; ;;
    -D|--debug) DEBUG="1"; shift 1; ;;
    -h|--help) print_help; ;;
    --variant) ZYPHOR_VARIANT="$2"; shift 2; ;;
    --version) ZYPHOR_VERSION="$2"; shift 2; ;;
    --subdir) TARGET_SUBDIR="$2"; shift 2; ;;
    --get-image-path) ACTION="get-image-path"; shift 1; ;;
    --clean) ACTION="clean"; shift 1; ;;
    --no-clean) NO_CLEAN="1"; shift 1 ;;
    --) shift; break; ;;
    *) echo "ERROR: Invalid command-line option: $1" >&2; exit 1; ;;
  esac
done

# Define log file
BUILD_LOG="$(pwd)/build.log"
debug "BUILD_LOG: $BUILD_LOG"
# Create empty file
: > "$BUILD_LOG"

# Set default values
ZYPHOR_ARCH=${ZYPHOR_ARCH:-$HOST_ARCH}
if [ "$ZYPHOR_ARCH" = "x64" ]; then
  ZYPHOR_ARCH="amd64"
elif [ "$ZYPHOR_ARCH" = "x86" ]; then
  ZYPHOR_ARCH="i386"
fi
debug "ZYPHOR_ARCH: $ZYPHOR_ARCH"

if [ -z "$ZYPHOR_VERSION" ]; then
  ZYPHOR_VERSION="$(default_version $ZYPHOR_DIST)"
fi
debug "ZYPHOR_VERSION: $ZYPHOR_VERSION"

# Check parameters
debug "HOST_ARCH: $HOST_ARCH"
if [ "$HOST_ARCH" != "$ZYPHOR_ARCH" ]; then
  case "$HOST_ARCH/$ZYPHOR_ARCH" in
    amd64/i386|i386/amd64)
    ;;
    *)
      echo "Can't build $ZYPHOR_ARCH image on $HOST_ARCH system" >&2
      exit 1
    ;;
  esac
fi

# Build parameters for lb config
ZYPHOR_CONFIG_OPTS="--distribution $ZYPHOR_DIST -- --variant $ZYPHOR_VARIANT"
if [ -n "$OPT_pu" ]; then
  ZYPHOR_CONFIG_OPTS="$ZYPHOR_CONFIG_OPTS --proposed-updates"
  ZYPHOR_DIST="$ZYPHOR_DIST+pu"
fi
debug "ZYPHOR_CONFIG_OPTS: $ZYPHOR_CONFIG_OPTS"
debug "ZYPHOR_DIST: $ZYPHOR_DIST"

# Set sane PATH (cron seems to lack /sbin/ dirs)
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
debug "PATH: $PATH"

if grep -q -e "^ID=debian" -e "^ID_LIKE=debian" /usr/lib/os-release; then
  debug "OS: $( . /usr/lib/os-release && echo $NAME $VERSION )"
elif [ -e /etc/debian_version ]; then
  debug "OS: $( cat /etc/debian_version )"
else
  echo "ERROR: Non Debian-based OS" >&2
fi

if [ ! -d "$(dirname $0)/zyphor-config/variant-$ZYPHOR_VARIANT" ]; then
  echo "ERROR: Unknown variant of Kali live configuration: $ZYPHOR_VARIANT" >&2
fi
require_package live-build "1:20250814+kali2"

# We need root rights at some point
if [ "$(whoami)" != "root" ]; then
  if ! which $SUDO >/dev/null; then
    echo "ERROR: $0 is not run as root and $SUDO is not available" >&2
    exit 1
  fi
else
  SUDO="" # We're already root
fi
debug "SUDO: $SUDO"

IMAGE_NAME="$(image_name $ZYPHOR_ARCH)"
debug "IMAGE_NAME: $IMAGE_NAME"

debug "ACTION: $ACTION"
if [ "$ACTION" = "get-image-path" ]; then
  echo $(target_image_name $ZYPHOR_ARCH)
  exit 0
fi

if [ "$NO_CLEAN" = "" ]; then
  clean
fi
if [ "$ACTION" = "clean" ]; then
  exit 0
fi

# Create image output location
mkdir -pv $TARGET_DIR/$TARGET_SUBDIR
[ $? -eq 0 ] || failure

# Don't quit on any errors now
set +e

debug "Stage 1/2 - Config" # ./auto/config
run_and_log lb config -a $ZYPHOR_ARCH $ZYPHOR_CONFIG_OPTS "$@"
[ $? -eq 0 ] || failure

debug "Stage 2/2 - Build"
run_and_log $SUDO lb build # ./auto/build... but missing for us
if [ $? -ne 0 ] || [ ! -e $IMAGE_NAME ]; then
  failure
fi

# If a command fails, make the whole script exit
set -e

debug "Moving files"
run_and_log mv -f $IMAGE_NAME $TARGET_DIR/$(target_image_name $ZYPHOR_ARCH)
run_and_log mv -f "$BUILD_LOG" $TARGET_DIR/$(target_build_log $ZYPHOR_ARCH)

echo -e "\n***\nGENERATED IMAGE: $(readlink -f $TARGET_DIR/$(target_image_name $ZYPHOR_ARCH))\n***"
