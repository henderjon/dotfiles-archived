### git

To view branches in relation to their tracking branch:

  - `$ git branch -vv`
  - `$ git branch -a -vv`

To set up tracking, after the fact

  - `$ git branch --set-upstream LOCALBRANCH REMOTE/REMOTEBRANCH`

To patch via patch

  - `$ git diff --no-ext-diff OLD..NEW > patch.diff`
  - `$ patch –p1 --dry-run --verbose < patch.diff`

To create/remove a git tag

  - `$ git tag -a -m "message" TAGNAME TARGETCOMMIT`
  - `$ git push REMOTE --tags`
  - `$ git tag -d TAGNAME`
  - `$ git push REMOTE :refs/tags/TAGNAME`

To remove a remote branch:

  - `$ git branch -d BRANCH`
  - `$ git push REMOTE :BRANCH`

To figure out what's going down on a remote

  - `$ git remote show REMOTE`
  
To clean commits out of a repo

  - `git reflog expire --expire=now --all`
  - `git gc --prune=now`

### diff -e

generate an ed command file

### diff -u

http://www.computerhope.com/unix/udiff.htm

```
--- from-file mod-time
+++ to-file mod-time
@@ from-file{line-number,lines} to-file{line-number,lines} @@
- line from from-file
  line in both files
+ line from to-file
```

### Vimdiff (merging)

  - ctrl+w ctrl+w - switch windows
  - do - diff obtain
  - dp - diff put
  - [c - previous difference
  - ]c - next difference
  - :diffupdate - diff update ;)
  - :syntax off - syntax off
  - zo - open folded text
  - zc - close folded text

### ripping cds

  - `$ mkcue > file.cue`
  - `$ cdparanoia 1- -O 102 file.wav`
  - `$ cdparanoia 1- -v --log-summary=file.log -O 102 file.wav`

If mkcue doesn't work run `drutil status` get the device name. Then `sudo umount {deviceName}`. Then you can run `mkcue deviceName > file.cue`.

Other stuff: cuetools, shntool ... (cuebreakpoints) used to split stuff

### cloning disks

  - `$ dd if=/dev/disk1 of=path/to/file.name bs=1024k`
  - `$ df -k /Volumes/*`
  - `$ drutil status`
  - `$ diskutil`

### cdr to iso (mac to mac/win)

  - `hdiutil makehybrid -iso -joliet -o Master.iso Master.cdr`

### rsync

  - `$ rsync -avh --progress --exclude=.DS_Store SRC DEST`
    - `--dry-run`
    - `--progress`Ω

### breaking large files

  - tar czvf - input.file | split -b 256m - output.file.prefix.
  - cat *.tgz.* | tar xvf -

### whats my ip

  - `$ dig TXT +short o-o.myaddr.l.google.com @ns1.google.com`

### permissions

http://permissions-calculator.org/

```
    4 2 1 4 2 1 4 2 1
d s r w x r w x r w x
| | | | | | | | | | |
| | | | | | | | | | +- other (o) execute
| | | | | | | | | +--- other (o) write
| | | | | | | | +----- other (o) read
| | | | | | | +------- group (g) execute
| | | | | | +--------- group (g) write
| | | | | +----------- group (g) read
| | | | +------------- user (u) execute
| | | +--------------- user (u) write
| | +----------------- user (u) read
| +------------------- special bit (see below)
+--------------------- type
```

  - 0766 - go+rw,u+rwx
  - 0755 - go+rx,u+rwx

In octal the special bit is "4" or "s" and will be capital "S" if lacking executable permissions

  - setuid = 4 (u+s, run as user; s in `ls`)
  - setgid = 2 (g+s, run as group; S in `ls`)
  - Sticky bit = 1 (+t)

symbolic: `chmod [who][add/remove][perm][,[who][add/remove][perm]]`

  - [who] = u/g/o/a
  - [add/remove] = +/-
  - [perm] = r/w/x/s

octal: `chmod [special][user][group][other/world]`

  - [special] = 4/0
  - [user] = 1/2/3/4/5/6/7/0
  - [group] = 1/2/3/4/5/6/7/0
  - [other/world] = 1/2/3/4/5/6/7/0

### MySQL

  - `$ mysqldump -e -u useranme -p database | gzip > file.sql.gz`
  - `$ gunzip < file.sql.gz | mysql -u username -p database`
  - `$ mysql -u username -p database_name < file.sql`

To export to a CSV:

  - `SELECT * INTO OUTFILE '/tmp/result.txt' FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\n' FROM test_table;`

### WGET Mirror Web Page

  - `$ wget --recursive --no-clobber --page-requisites --adjust-extension (--html-extension) --convert-links --domains site.com www.site.com`
  - `$ wget -r -nc -p -E -k -D site.com www.site.com`
  - `$ wget -rpEk -nc -D site.com www.site.com`
  - `--span-hosts`
  - `--user-agent`
  - `--limit-rate` (=20k)
  - `--wait` (=3)

### Sublime Text 2

`import urllib2,os;pf='Package Control.sublime-package';ipp=sublime.installed_packages_path();os.makedirs(ipp) if not os.path.exists(ipp) else None;open(os.path.join(ipp,pf),'wb').write(urllib2.urlopen('http://sublime.wbond.net/'+pf.replace(' ','%20')).read())`

### Sublime Text 3

`import urllib.request,os; pf = 'Package Control.sublime-package'; ipp = sublime.installed_packages_path(); urllib.request.install_opener( urllib.request.build_opener( urllib.request.ProxyHandler()) ); open(os.path.join(ipp, pf), 'wb').write(urllib.request.urlopen( 'http://sublime.wbond.net/' + pf.replace(' ','%20')).read()) `

### ST3 themes

https://github.com/skuroda/PackageResourceViewer

### CRON

Numeric values can be comma seperated (e.g. "0,30 6,18 2,20 3,4 * command-to-run.sh" )

intervals are expressed as */X where x is a number

```
* * * * * command to be executed
| | | | |
| | | | +----- day of week (0 - 6) (Sunday=0)
| | | +------- month (1 - 12)
| | +--------- day of month (1 - 31)
| +----------- hour (0 - 23)
+------------- min (0 - 59)
```

### Input Redirection (0=STDIN; 1=STDOUT; 2=STDERR)

  - >     -- Redirect standard output
  - 2>    -- Redirect standard error
  - 2>&1  -- Redirect standard error to standard output
  - <     -- Redirect standard input
  - |     -- Pipe standard output to another command
  - >>    -- Append to standard output
  - 2>&1| -- Pipe standard output and standard error to another command

## ssh

  - `$ ssh-keygen -t rsa -C "email@address.com"`
  - `$ service sshd restart`
  - `$ cat .id_rsa.pub >> .ssh/authorized_keys`
  - `$ chmod og-rw authorized_keys` ... `chmod 600 authorized_keys`
  - `$ chmod a-x authorized_keys`
  - `$ chmod 700 .ssh`

To turn off root login, edit: /etc/ssh/sshd_config:

```
# Prevent root logins
PermitRootLogin no
```

## gifs

  - transparent `<img src="data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7">`
  - black `<img src="data:image/gif;base64,R0lGODlhAQABAIAAAAUEBAAAACwAAAAAAQABAAACAkQBADs=">`


## LS_COLORS

  - [link 1](http://www.bigsoft.co.uk/blog/index.php/2008/04/11/configuring-ls_colors)
  - [link 2](http://www.linux-sxs.org/housekeeping/lscolors.html)
  - [link 3](http://geoff.greer.fm/lscolors/)


```
no  NORMAL, NORM  Global default, although everything should be something
fi  FILE  Normal file
di  DIR Directory
ln  SYMLINK, LINK, LNK  Symbolic link. If you set this to ‘target’ instead of a numerical value, the color is as for the file pointed to.
pi  FIFO, PIPE  Named pipe
do  DOOR  Door
bd  BLOCK, BLK  Block device
cd  CHAR, CHR Character device
or  ORPHAN  Symbolic link pointing to a non-existent file
so  SOCK  Socket
su  SETUID  File that is setuid (u+s)
sg  SETGID  File that is setgid (g+s)
tw  STICKY_OTHER_WRITABLE Directory that is sticky and other-writable (+t,o+w)
ow  OTHER_WRITABLE  Directory that is other-writable (o+w) and not sticky
st  STICKY  Directory with the sticky bit set (+t) and not other-writable
ex  EXEC  Executable file (i.e. has ‘x’ set in permissions)
mi  MISSING Non-existent file pointed to by a symbolic link (visible when you type ls -l)
lc  LEFTCODE, LEFT  Opening terminal code
rc  RIGHTCODE, RIGHT  Closing terminal code
ec  ENDCODE, END  Non-filename text
*.extension   Every file using this extension e.g. *.jpg
```

The keys (above) are assigned a colour pattern which is a semi-colon separated list of colour codes.


### Effects

```
00  Default colour
01  Bold
04  Underlined
05  Flashing text
07  Reversetd
08  Concealed
```

### Colours

```
30  Black
31  Red
32  Green
33  Orange
34  Blue
35  Purple
36  Cyan
37  Grey
```

### Backgrounds

```
40  Black background
41  Red background
42  Green background
43  Orange background
44  Blue background
45  Purple background
46  Cyan background
47  Grey background
```

### Extra colours

```
90  Dark grey
91  Light red
92  Light green
93  Yellow
94  Light blue
95  Light purple
96  Turquoise
97  White
100 Dark grey background
101 Light red background
102 Light green background
103 Yellow background
104 Light blue background
105 Light purple background
106 Turquoise background
```
