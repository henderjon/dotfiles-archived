%: VBoxManage list vms

## Port Forwarding

%: VBoxManage modifyvm centos-server --natdnshostresolver1 on

# set 127.0.0.1:$port to hit the vm at ...
%: VBoxManage modifyvm centos-server --natpf1 "guest-ssh,tcp,,2223,,22"
%: VBoxManage modifyvm centos-server --natpf1 "guest-http,tcp,,8080,,80"
%: VBoxManage modifyvm centos-server --natpf1 "guest-https,tcp,,8043,,443"
%: VBoxManage modifyvm centos-server --natpf1 "guest-mysql,tcp,,8006,,3306"

# remove a port forwarding rule

%: VBoxManage modifyvm centos-server --natpf1 delete "guest-http"

# set up file sharing

%: VBoxManage sharedfolder add centos-server --name shared --hostpath ~ --automount

# IO

%: VBoxManage startvm centos-server --type headless
%: VBoxManage controlvm centos-server poweroff

## VBox Guest Additions
# centos

%: yum install gcc make kernel-devel bzip2
%: yum update kernel
%: yum -y install epel-release

## user management
%: usermod -a -G vboxsf,wheel,root -g $username $username

## mount code folder
%: sudo mount -t vboxsf -o rw,uid=1000,gid=1000 $sharename /var/www

## PHP
# php conf needs to have the correct user/group

