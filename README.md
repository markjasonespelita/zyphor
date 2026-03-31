# Build-Scripts

**Zyphor** is a custom Linux distribution built on top of the powerful foundations of **Kali Linux** and **Debian**.

Designed with simplicity, performance, and control in mind, **Zyphor** aims to deliver a streamlined operating system experience without unnecessary bloat.

One of **Zyphor**’s core goals is to provide a Windows-like user experience — making it easy for users transitioning from Windows to feel right at home. From layout and navigation to workflow and usability, **Zyphor** minimizes the learning curve while still offering the full power of Linux underneath.

## Packages and Initialization

```bash
sudo apt update

sudo apt install -y git live-build simple-cdd cdebootstrap curl

git clone https://gitlab.com/kalilinux/build-scripts/live-build-config.git
```

## Build

```bash
./build.sh --verbose
```

## Virtual Machine For Testing (QEMU System x86_64)

```bash
sudo apt update

sudo apt install qemu-system-x86 qemu-utils qemu-system-gui libvirt-daemon-system libvirt-clients bridge-utils virt-manager -y
```

# Virtualization Check Compatibility

## ✅ Step 1: Check if your CPU supports virtualization

```bash
egrep -c '(vmx|svm)' /proc/cpuinfo
```
* If result is 0 ❌ → your CPU or BIOS virtualization is OFF
* If > 0 ✅ → good, continue

## ✅ Step 2: Enable virtualization in BIOS

Reboot → enter BIOS/UEFI → enable:

* Intel: VT-x
* AMD: SVM

Save and boot back.

## ✅ Step 3: Install KVM packages

```bash
sudo apt update

sudo apt install qemu-kvm libvirt-daemon-system libvirt-clients bridge-utils -y
```

## ✅ Step 4: Load KVM modules

For Intel:

```bash
sudo modprobe kvm-intel
```

For AMD:

```bash
sudo modprobe kvm-amd
```

Then check:

```bash
lsmod | grep kvm
```
You should see **kvm_intel** or **kvm_amd**

## ✅ Step 5: Test the ISO

```bash
sudo qemu-system-x86_64 --enable-kvm --cdrom <iso-name>.iso -m 2048
```