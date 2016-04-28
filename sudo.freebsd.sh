#!/usr/bin/env sh

GOLANGV=https://storage.googleapis.com/golang/go1.6.2.linux-amd64.tar.gz

cd
# all the cool kids use pkg now
pkg update

# cd
# ... but we still want ports around
# portsnap fetch extract

cd
# install the userful tools
pkg install vim git zsh tmux ipfw

cd
# firewall
cat <<-RCCATBLOCK
	# ipfw -- firewall
	firewall_enable="YES"
	firewall_quiet="YES"
	firewall_type="workstation"
	firewall_myservices="22 80"
	firewall_allowservices="any"
	firewall_logdeny="YES"

	# ntpd -- Network Time Protocol
	ntpd_enable="YES"
	ntpd_sync_on_start="YES"
RCCATBLOCK >> /etc/rc.conf
service ipfw start
service ntpd start
printf "net.inet.ip.fw.verbose_limit=5" >> /etc/sysctl.conf
sysctl net.inet.ip.fw.verbose_limit=5

cd
# install golang
fetch $GOLANGV
tar -C /usr/local -xvf $GOLANGV
