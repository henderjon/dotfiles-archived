%: VBoxManage list vms
%: VBoxManage modifyvm centos-server --natpf1 "guestssh,tcp,,2222,,22"
%: VBoxManage modifyvm centos-server --natdnshostresolver1 on
%: VBoxManage sharedfolder add centos-server --name shared --hostpath ~ --automount
%: VBoxManage startvm ubuntu-server --type headless
%: VBoxManage controlvm UbuntuServer poweroff

## VBox Guest Additions
# centos
%: yum install gcc make kernel-devel bzip2
%: yum update kernel
