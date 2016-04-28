

cd
# all the cool kids use pkg now
/usr/sbin/pkg

cd
# ... but we still want ports around
portsnap fetch extract

cd
# firewall
cat ~/dotfiles/freebsd/ipfw.txt >> /etc/rc.conf
service ipfw start
print "net.inet.ip.fw.verbose_limit=5" >> /etc/sysctl.conf
sudo sysctl net.inet.ip.fw.verbose_limit=5

cd
# ntpd -- Network Time Protocol
print 'ntpd_enable="YES"
ntpd_sync_on_start="YES"' >> /etc/rc.conf
sudo service ntpd start
