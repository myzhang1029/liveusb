# UEFI and Legacy USB Recovery Disc

1. GParted Live USB 1.3.0-1 i686 from <https://sourceforge.net/projects/gparted>.
   Additional packages added: `kexec-tools`, `chntpw`, following
   <https://gparted.org/add-packages-in-gparted-live.php>.

2. GRUB4DOS from <https://sourceforge.net/projects/grub4dos>.
   Can be loaded through modified `syslinux/syslinux.cfg`.

3. Custom built BIOS iPXE from <https://git.ipxe.org/ipxe.git>.
   Can be loaded through modified `syslinux/syslinux.cfg`.
   ```
   cd src
   make
   cp bin/ipxe.lkrn $HERE
   ```

4. Custom built UEFI iPXE from <https://git.ipxe.org/ipxe.git>.
   Can be loaded through modified `boot/grub/grub.cfg`.
   ```
   cd src
   make bin-x86_64-efi/ipxe.efi bin-i386-efi/ipxe.efi
   cp bin-x86_64-efi/ipxe.efi $HERE/EFI/boot/ipxex64.efi
   cp bin-i386-efi/ipxe.efi $HERE/EFI/boot/ipxeia32.efi
   ```

5. UEFI memtest86 from <https://memtest86.com/download.htm>, <https://www.memtest86.com/downloads/memtest86-usb.zip>.
   Can be loaded through modified `boot/grub/grub.cfg`.

6. Windows PE created with <https://docs.microsoft.com/en-us/windows-hardware/manufacture/desktop/winpe-create-usb-bootable-drive>.
   Modified to dual-boot x86 and x64 versions following <https://deploymentresearch.com/creating-a-dual-boot-winpe-5-0-boot-image-x86-and-x64-support/>.
   Can be loaded through modified `boot/grub/grub.cfg` or `menu.lst`.

7. Hiren's boot CD PE from <https://www.hirensbootcd.org/files/HBCD_PE_x64.iso>,
   unpacked to a partition.
   Can be loaded through modified `boot/grub/grub.cfg` or `menu.lst`.

All UEFI programs have an ia32 version and a x86 version.

Except for Grub2, which has the EFI name boot, other programs have been renamed.