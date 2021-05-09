#!/bin/sh
# Install addditional packages for wifi access
for pkg in firmware-iwlwifi_20210315-2_all.deb libpcsclite1_1.9.1-1_i386.deb libnl-route-3-200_3.4.0-1+b1_i386.deb wpasupplicant_2%3a2.9.0-21_i386.deb dhcpcd5_7.1.0-2_i386.deb libiw30_30~pre9-13.1_i386.deb wireless-tools_30~pre9-13.1_i386.deb
do
    dpkg -i "$pkg"
done
