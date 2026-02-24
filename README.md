# OSWA Recon & Payload Toolkit

Collection of bash helper scripts I created while preparing for the **Offensive Security Web Assessor (OSWA)** certification (WEB-200 course).

These scripts are designed to speed up repetitive tasks during web application penetration testing / black-box assessments:
- Generating recon command lists
- Running quick port+directory scans
- Building XSS payload templates with exfiltration examples

**⚠️ Disclaimer**  
These are personal notes / automation helpers — **not official OffSec material**.  
Use responsibly, only on targets you have **explicit written permission** to test.  
I am not responsible for any misuse.

## What's Inside

| File                        | Purpose                                                                 | Main Tools / Focus                     |
|-----------------------------|-------------------------------------------------------------------------|----------------------------------------|
| `recon-commands.sh`         | Interactive command generator + cheat-sheet for recon & vuln discovery  | Nmap, Gobuster, Wfuzz, sqlmap, XSS/SQLi/LFI/IDOR fuzzing |
| `recon-scans.sh`            | Quick automated scanning script (Nmap + multiple Gobuster runs)         | Nmap, Gobuster (big / raft / directory-list wordlists) |
| `xss-templates.sh`          | Generates common XSS payloads with exfil / keylogger / phishing examples| Cookie theft, localStorage, keylogging, script loading, form phishing |

## Usage

### 1. recon-commands.sh

Generates a full list of recon & fuzzing commands tailored to your target.

```bash
chmod +x recon-commands.sh
./recon-commands.sh
