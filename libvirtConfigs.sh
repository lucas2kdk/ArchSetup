pacman -S libvirt libvirt-glib libvirt-python virt-install virt-manager qemu qemu-arch-extra ovmf vde2 ebtables dnsmasq bridge-utils openbsd-netcat iptables swtpm

systemctl enable libvirtd --now
mv /etc/libvirt/libvirtd.conf /etc/libvirt/libvirtd.conf.old
gpasswd -M lucas kvm
gpasswd -M lucas libvirt

cp libvirtConfigs/libvirtd.conf /etc/libvirt

mv /etc/libvirt/qemu.conf /etc/libvirt/qemu.conf.old
cp libvirtConfigs/qemu.conf /etc/qemu

virsh net-autostart default
virsh net-start default

systemctl restart libvirtd
