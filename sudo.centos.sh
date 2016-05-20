#!/usr/bin/env bash

GOLANGU=https://storage.googleapis.com/golang
GOLANGF=go1.6.2.linux-amd64.tar.gz

yum install vim git zsh tmux ed iptables sudo ntp ntpdate ntp-doc

cd
# install the firewall
#!/usr/bin/env bash
iptables-restore <<-IPTABLEBLOCK
	*filter
	:INPUT DROP [0:0]
	:FORWARD DROP [0:0]
	:OUTPUT ACCEPT [0:0]

	# allow ssh
	-A INPUT -p tcp -m tcp --dport 22 -j ACCEPT

	# allow http
	-A INPUT -p tcp -m tcp --dport 80 -j ACCEPT

	# allow ICMP
	-A INPUT -p icmp -j ACCEPT

	# allow local traffic
	-A INPUT -s 127.0.0.1/32 -j ACCEPT

	# don't break current connections and drop everything else
	-A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
	-A INPUT -j REJECT --reject-with icmp-port-unreachable
	-A FORWARD -i eth0 -m state --state RELATED,ESTABLISHED -j ACCEPT
	-A FORWARD -j REJECT --reject-with icmp-port-unreachable
	-A OUTPUT -m state --state NEW,RELATED,ESTABLISHED -j ACCEPT

	COMMIT
IPTABLEBLOCK
iptables -L

cd
# install ntp
/etc/init.d/ntpd start

cd
# disable password auth
sed --in-place="" 's/#\?[[:blank:]]\{0,\}PasswordAuthentication yes/PasswordAuthentication no/g' /etc/ssh/sshd_config
sed --in-place="" 's/#\?[[:blank:]]\{0,\}ChallengeResponseAuthentication yes/ChallengeResponseAuthentication no/g' /etc/ssh/sshd_config
service sshd reload # systemctl reload sshd.service

cd
# install golang
wget "$GOLANGU/$GOLANGF"
tar -C /usr/local -xvf "$GOLANGF"

# https://wiki.centos.org/HowTos/Network/SecuringSSH
# PermitRootLogin no
# AllowUsers alice bob

### IPTABLES NOTES #############################################################
#
# drop ICMP pings
# iptables -A INPUT -p icmp --icmp-type echo-request -j DROP
# iptables -A INPUT -i eth1 -p icmp --icmp-type echo-request -j DROP
#
# eg
# iptables -A :chain -p :protocol -m :match --dport :port -j :action
#
### RUN
################################################################################
#
# iptables-restore < this.file
# iptables -L
#
### COMMON PORTS ###
# http: 80, 443
# ssh: 22
# ftp: 21
# mysql: 3306
# redis: 6379
# IRC: 6667
# gearman: 4730
# memcache: 11211
