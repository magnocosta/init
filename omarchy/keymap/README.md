# Linux Install - Wally Wiki

## Overview
To use Keymapp or Wally (deprecated) for flashing your board on Linux, you need to:
1. Install required dependencies
2. Add a udev rule file to your distribution
3. Download the Keymapp or Wally binary

## 1. Install Required Dependencies

Note: Some distributions may already have these dependencies installed (e.g., Ubuntu).

Keymapp/Wally's GUI requires three dependencies: `gtk3`, `libwebkit2gtk`, and `libusb`. The CLI version requires only `libusb`.

### Important Notes:
- Starting from Keymapp 1.2.0, libwebkit2gtk requires version 4.1 instead of 4.0
- If using a snap-packaged browser, ensure it has USB access:
```
snap connect chromium:raw-usb
```

### 1.1 Arch and Derivatives
```bash
sudo pacman -S libusb webkit2gtk-4.1 gtk3
```

### 1.2 Debian and Derivatives
```bash
sudo apt install libwebkit2gtk-4.1-0 libgtk-3-0 libusb-1.0-0
```

### 1.3 Red Hat/Fedora and Derivatives
```bash
sudo yum install gtk3 webkit2gtk4.1 libusb
```

## 2. Create a udev Rule File

Device-related events are managed in userspace by `udevd`. Custom `.rules` files enable device access without elevated privileges.

Create `/etc/udev/rules.d/50-zsa.rules`:
```bash
sudo touch /etc/udev/rules.d/50-zsa.rules
```

Add this configuration:
```
# Rules for Oryx web flashing and live training
KERNEL=="hidraw*", ATTRS{idVendor}=="16c0", MODE="0664", GROUP="plugdev"
KERNEL=="hidraw*", ATTRS{idVendor}=="3297", MODE="0664", GROUP="plugdev"

# Legacy rules for live training over webusb (Not needed for firmware v21+)
  # Rule for all ZSA keyboards
  SUBSYSTEM=="usb", ATTR{idVendor}=="3297", GROUP="plugdev"
  # Rule for the Moonlander
  SUBSYSTEM=="usb", ATTR{idVendor}=="3297", ATTR{idProduct}=="1969", GROUP="plugdev"
  # Rule for the Ergodox EZ
  SUBSYSTEM=="usb", ATTR{idVendor}=="feed", ATTR{idProduct}=="1307", GROUP="plugdev"
  # Rule for the Planck EZ
  SUBSYSTEM=="usb", ATTR{idVendor}=="feed", ATTR{idProduct}=="6060", GROUP="plugdev"

# Wally Flashing rules for the Ergodox EZ
ATTRS{idVendor}=="16c0", ATTRS{idProduct}=="04[789B]?", ENV{ID_MM_DEVICE_IGNORE}="1"
ATTRS{idVendor}=="16c0", ATTRS{idProduct}=="04[789A]?", ENV{MTP_NO_PROBE}="1"
SUBSYSTEMS=="usb", ATTRS{idVendor}=="16c0", ATTRS{idProduct}=="04[789ABCD]?", MODE:="0666"
KERNEL=="ttyACM*", ATTRS{idVendor}=="16c0", ATTRS{idProduct}=="04[789B]?", MODE:="0666"

# Keymapp / Wally Flashing rules for the Moonlander and Planck EZ
SUBSYSTEMS=="usb", ATTRS{idVendor}=="0483", ATTRS{idProduct}=="df11", MODE:="0666", SYMLINK+="stm32_dfu"
# Keymapp Flashing rules for the Voyager
SUBSYSTEMS=="usb", ATTRS{idVendor}=="3297", MODE:="0666", SYMLINK+="ignition_dfu", GROUP="plugdev"
SUBSYSTEMS=="usb", ATTRS{idVendor}=="3297", MODE="0666", GROUP="plugdev"
```

Ensure your user is in the plugdev group:
```bash
sudo groupadd plugdev
sudo usermod -aG plugdev $USER
```

Log out after this step. If issues persist, reboot and try again.

## 3. Download and Run the Binary

Download the [latest Keymapp Linux version](https://oryx.nyc3.cdn.digitaloceanspaces.com/keymapp/keymapp-latest.tar.gz), extract it, make it executable, and run:
```bash
chmod +x keymapp
```

Or download the [latest Wally Linux version](https://configure.ergodox-ez.com/wally/linux), make it executable, and run. Note: Wally is deprecated and incompatible with newer keyboards.

For issues, [contact support](mailto:contact@ergodox-ez.com).

---

> This README is a copy of the official ZSA wiki page: https://github.com/zsa/wally/wiki/Linux-install

## Magno Notes
 - I've used that page to install the keymapp app on Omarchy.
 - Keymapp is the app from ZSA to configure my Moonlander keyboard.
 - I've extracted all the shell commands to the file `install.sh`.
    - How to use the `install.sh`
        - Download the Linux binary file in the ZSA site.
        - Once the folder is in the ~/Download you only need to run the file `./install.sh`
