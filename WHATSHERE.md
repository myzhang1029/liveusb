# UEFI and Legacy USB Recovery Disc

1. GParted Live USB 1.4.0-5 i686 PXE from <https://sourceforge.net/projects/gparted>.
   Downloaded from <https://sourceforge.net/projects/gparted/files/gparted-live-stable/1.4.0-5/gparted-live-1.4.0-5-i686-pae.zip>.
   Additional packages added: `kexec-tools`, `chntpw`, following
   <https://gparted.org/add-packages-in-gparted-live.php>.

2. GRUB4DOS from <https://sourceforge.net/projects/grub4dos>.
   Can be loaded through modified `syslinux/syslinux.cfg`.

3. Custom built BIOS iPXE from <https://git.ipxe.org/ipxe.git>.
   ```
   NET_PROTO_IPV6
   DOWNLOAD_PROTO_HTTPS
   DOWNLOAD_PROTO_FILE
   IMAGE_SCRIPT
   IMAGE_ZLIB
   IMAGE_GZIP
   NSLOOKUP_CMD
   REBOOT_CMD
   POWEROFF_CMD
   PING_CMD
   ```
   Can be loaded through modified `syslinux/syslinux.cfg`.
   ```
   cd src
   make
   cp bin/ipxe.lkrn $HERE
   ```

4. Custom built UEFI iPXE from <https://git.ipxe.org/ipxe.git>.
   We enabled
   ```
   NET_PROTO_IPV6
   DOWNLOAD_PROTO_HTTPS
   DOWNLOAD_PROTO_FILE
   IMAGE_SCRIPT
   IMAGE_EFI
   IMAGE_ZLIB
   IMAGE_GZIP
   NSLOOKUP_CMD
   REBOOT_CMD
   POWEROFF_CMD
   PING_CMD
   ```
   Can be loaded through modified `boot/grub/grub.cfg`.
   ```
   cd src
   make bin-x86_64-efi/ipxe.efi bin-i386-efi/ipxe.efi
   cp bin-x86_64-efi/ipxe.efi $HERE/EFI/boot/ipxex64.efi
   cp bin-i386-efi/ipxe.efi $HERE/EFI/boot/ipxeia32.efi
   ```

5. UEFI shell from <https://github.com/tianocore/edk2/blob/UDK2018/ShellBinPkg/UefiShell/>.
   Can be loaded through modified `boot/grub/grub.cfg`.

6. UEFI memtest86 from <https://memtest86.com/download.htm>, <https://www.memtest86.com/downloads/memtest86-usb.zip>.
   Can be loaded through modified `boot/grub/grub.cfg`.

7. Windows PE created following <https://docs.microsoft.com/en-us/windows-hardware/manufacture/desktop/winpe-create-usb-bootable-drive>.
   Modified to dual-boot x86 and x64 versions following <https://deploymentresearch.com/creating-a-dual-boot-winpe-5-0-boot-image-x86-and-x64-support/>.
   Can be loaded through modified `boot/grub/grub.cfg` or `menu.lst`.

8. Hiren's boot CD PE from <https://www.hirensbootcd.org/files/HBCD_PE_x64.iso>,
   Image copied to `sources/hbcdx64.wim` and added to Windows Bootmgr BCD.
   Can be loaded through modified `boot/grub/grub.cfg` or `menu.lst`.

All UEFI programs have an ia32 version and a x86 version. AArch64 versions are
being added.

Except for Grub2, which has the EFI name boot, other programs have been renamed.

The subdirectory `wifi_packages` are meant to be copied to another drive to
reduce the size of the recovery drive. Run `install.sh` as root to enable wifi.

For updates, please see <https://myzhang1029.coding.net/public/liveusb/liveusb/git/files>.
