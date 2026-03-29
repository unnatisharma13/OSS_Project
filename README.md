# OSS Capstone Project: The Open Source Audit

**Name:** Somya Neema
**Reg No:** 24BCE10486 
**Slot:** B22
**Course:** Open Source Software  
**College:** VIT Bhopal University 

---

## Software I Choose
**Git**
- Category: Version Control
- License: GPL v2
- Made by Linus Torvalds in 2005

I have selected Git since I already use it in my life and I wanted to learn more about it, not only the syntax but also the origin and the way it functions as it does.

---

## What's In This Repo

| File | What It Does |
|------|-------------|
| `SystemIdentityReport.sh` | Displays information about the kernel, user, and uptime of system |
| `FOSSPackageInspector.sh` | Report Answers the question whether a package is installed correctly and provides the information |
| `PermissionAuditor.sh` | Designates grants and sizes of key directories |
| `LogFile.sh` | Determines the number of times that a heyword is repeated in a log file |
| `Manifesto.sh` | Prompts you to answer 3 easy questions and comes up with your open source statement |

---

## How to Run the Scripts

First make them executable:
```bash
chmod +x SystemIdentityReport.sh
chmod +x FOSSPackageInspector.sh
chmod +x PermissionAuditor.sh
chmod +x LogFile.sh
chmod +x Manifesto.sh
```

**Script 1**
```bash
./SystemIdentityReport.sh
```
Displays a welcome page with your OS, kernel version, your username, time up and license details of Git.

**Script 2**
```bash
./FOSSPackageInspector.sh
./FOSSPackageInspector.sh git
```
Any package name may be passed or can be left blank which default to git.  
Indicates whether or not it is in place, and version and whereabouts with a philosophy note.


**Script 3**
```bash
./PermissionAuditor.sh
```
Browses in directories, such as /etc, /var/log, /usr/bin and displays the owner and size of them.  
Also checks for .gitconfig.


**Script 4**
```bash
./LogFile.sh
./LogFile.sh /var/log/system.log error
```
Processes a line of a log file and counts the number of matches of the key word.   
Sees the previous 5 lines which there are a replica.


**Script 5**
```bash
./Manifesto.sh
```
Goes through the 3 questions and personal open source manifesto using interactive question and answer.  
Also stores your personal open source manifesto as a personal file.

---

## Requirements

- MacOS Terminal or any Linux based operating system.
- Git installed — `brew install git` on Mac
- Bash shell (comes pre-installed)

---

## References

- gnu.org/philosophy/free-sw.html
- git-scm.com/book
- opensource.org/osd
- catb.org/~esr/writings/cathedral-bazaar
- survey.stackoverflow.co/2023
- spdx.org/licenses/GPL-2.0-only.html
- github.com/git/git
