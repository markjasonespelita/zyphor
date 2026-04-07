![Zyphor Logo](kali-config/variant-xfce/includes.chroot/usr/share/calamares/branding/youros/zyphor-full.png)
**By:** Mark Jason Penote Espelita  
**Creator Facebook Account:** https://www.facebook.com/mark.jason.penote.espelita  
**Email:** markjasonespelita@gmail.com  
**Contact:** 09978972884 | 09203454006  
**Created:** March 30, 2026

# Introduction

**Zyphor OS** is a custom Linux distribution built on top of the powerful foundations of **Kali Linux** and **Debian**.

Designed with simplicity, performance, and control in mind, **Zyphor OS** aims to deliver a streamlined operating system experience without unnecessary bloat.

One of **Zyphor OS**’s core goals is to provide a Windows-like user experience — making it easy for users transitioning from Windows to feel right at home. From layout and navigation to workflow and usability, **Zyphor OS** minimizes the learning curve while still offering the full power of Linux underneath.

# Build-Scripts

## Packages and Initialization

```bash
sudo apt update

sudo apt install -y git live-build simple-cdd cdebootstrap curl

git clone https://github.com/markjasonespelita/zyphor_os.git
```

## Build

```bash
cd zyphor_os

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

---

## 📚 References

- 🌐 [Debian Official Website](https://www.debian.org)
- 🐉 [Kali Linux Official Website](https://www.kali.org)
- 🧠 [The Linux Kernel (GitHub)](https://github.com/torvalds/linux)

---

## 📄 Attribution & Licensing

**Zyphor OS** is a custom Linux distribution built on top of  
**Debian** and **Kali Linux**.

We gratefully acknowledge the work of the developers and communities behind these projects.

- **Debian** provides the core system and package ecosystem.  
- **Kali Linux**, developed by **Offensive Security**, provides security tools and system enhancements.

---

## ⚖️ License Notice

**Zyphor OS** includes software packages distributed under various open-source licenses, including but not limited to:

- **GNU** General Public License (GPL)  
- **MIT License**  
- **Apache License** 

All original licenses remain in effect and are respected.

You can find license details for individual packages in:

```bash
/usr/share/doc/
```

---

## ⚠️ Disclaimer

**Zyphor OS** is an independent project and is **not affiliated with, endorsed by, or sponsored by**:

- **Kali Linux** 
- **Offensive Security**  
- **Debian**  

All trademarks and registered trademarks are the property of their respective owners.

---

## 🤝 Contributions

This project is open for contributions. Feel free to fork, modify, and submit pull requests.

---

## 🚧 Project Status

This project is still under active development.  
Contributions, suggestions, and improvements are welcome! 😊

---

## 🏷️ #hobby_project
## 🏷️ #open_source