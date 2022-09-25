#!/bin/sh

# Install addditional packages for wifi access. Order matters.
for pkg in firmware-iwlwifi_20210818-1_all.deb libpcsclite1_1.9.9-1_i386.deb \
    libnl-route-3-200_3.7.0-0.2+b1_i386.deb dhcpcd-base_9.4.1-6_i386.deb \
    dhcpcd5_9.4.1-6_all.deb wpasupplicant_2.10-9+b1_i386.deb \
    libiw30_30~pre9-13.1_i386.deb wireless-tools_30~pre9-13.1_i386.deb
do
    dpkg -i "$pkg"
done

# Reload drivers
rmmod iwlwifi
modprobe iwlwifi

# Get wpa_supplicant up
cat > /etc/wpa_supplicant.conf << 'EOF'
ctrl_interface=/run/wpa_supplicant
update_config=1
EOF

cat << 'EOF'
Use `wpa_supplicant -B -Dnl80211 -c/etc/wpa_supplicant.conf [-i<interface>]
And `wpa_cli` to get Wi-Fi access.

For WPA Personal SSIDs, usually the following commands will get you connected:
```
> scan
> scan_results
> add_network
0
> set_network 0 ssid "<SSID>"
> set_network 0 psk "<passphrase>"
> enable network 0
> quit
```

If there is no password, configure network with:
```
> set_network 0 psk "passphrase"
> set_network 0 key_mgmt NONE
```

For WPA2 Enterprise:
```
> set_network 0 key_mgmt WPA-EAP
> set_network 0 eap PEAP
> set_network 0 identity "<username>"
> set_network 0 password "<password>"
> set_network 0 phase2 "autheap=MSCHAPV2"
```
EOF
exit 0
