sudo /bin/cat << EOF > /etc/dnsmasq.conf

#Don't function as a DNS server:
port=0

#Log lots of extra information about DHCP transactions.
log-dhcp

enable-tftp
tftp-root=/var/lib/tftpboot

#Disable re-use of the DHCP servername and filename fields as extra
#option space. That's to avoid confusing some old or broken DHCP clients.
dhcp-no-override

pxe-prompt="Press F8 for NBP (Net Boot Program) menu.Default kkpxe.", 10

#0
pxe-service=X86PC, "kkpxe for Legacy BIOS", undionly.kkpxe
pxe-service=X86PC, "kpxe for Legacy BIOS", undionly.kpxe
pxe-service=X86PC, "pxe for Legacy BIOS", undionly.pxe

#2
pxe-service=IA64_EFI, "Boot IA64_EFI", uefi/ipxe64.efi

#6
pxe-service=IA32_EFI, "Boot IA32_EFI", uefi/ipxe32.efi

#7
pxe-service=X86-64_EFI, "Boot X86-64_EFI", uefi/ipxe64.efi

#8
pxe-service=Xscale_EFI, "Boot BC_EFI", uefi/ipxe64.efi

#9
pxe-service=BC_EFI, "Boot BC_EFI", uefi/ipxe64.efi

EOF

ip=$(/sbin/ifconfig |grep -v 127 | grep 'inet ' | sed 's/^.*inet addr://g'    | sed 's/ *Bcast.*$//g') 

echo "dhcp-range=$ip,proxy" >> /etc/dnsmasq.conf


/usr/local/sbin/dnsmasq -9 &