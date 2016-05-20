#!/usr/bin/env sh

GOLANGU=https://storage.googleapis.com/golang
GOLANGF=go1.6.2.freebsd-amd64.tar.gz

cd
# all the cool kids use pkg now
pkg update

cd
# install the userful tools
pkg install vim git zsh tmux # ipfw

cd
# firewall
printf '\
# ipfw -- firewall\
firewall_enable="YES"\
firewall_quiet="YES"\
firewall_type="workstation"\
firewall_myservices="22/tcp 80/tcp"\
firewall_allowservices="any"\
firewall_logdeny="YES"\
\
# ntpd -- Network Time Protocol\
ntpd_enable="YES"\
ntpd_sync_on_start="YES"\
' >> /etc/rc.conf
service ipfw start
service ntpd start
printf "net.inet.ip.fw.verbose_limit=5" >> /etc/sysctl.conf
sysctl net.inet.ip.fw.verbose_limit=5

cd
# disable password auth
sed -i "" 's/#\?[[:blank:]]\{0,\}PasswordAuthentication yes/PasswordAuthentication no/g' /etc/ssh/sshd_config
sed -i "" 's/#\?[[:blank:]]\{0,\}ChallengeResponseAuthentication yes/ChallengeResponseAuthentication no/g' /etc/ssh/sshd_config
service sshd reload # systemctl reload sshd.service

cd
# install golang
fetch "$GOLANGU/$GOLANGF"
tar -C /usr/local -xvf "$GOLANGF"

# cd
# ... but we still want ports around
# portsnap fetch extract
