
# oswa_recon

`oswa_recon.sh` is a simple Bash wrapper script for `nmap` and `gobuster`, created specifically for the Offensive Security Web Assessor (OSWA) exam. The goal is to automate common recon scans so you can spend more time manually enumerating the web application.

This tool focuses on simplicity and speed — using only the necessary scans that are typically required during the exam.

---

## Features

- Automates `nmap` service detection and script scans
- Runs multiple `gobuster` scans with commonly used wordlists
- Saves scan results to clearly named output files
- Designed with minimal interaction: just input IP and port

---

## Usage

Make the script executable and run it:

```bash
chmod +x oswa_recon.sh
./oswa_recon.sh
````

You will be prompted to enter:

* Target IP address
* Port number (defaults to 80 if left blank)

The script will run:

* `nmap` with `-sV -sC` on the provided IP and port
* Three `gobuster` scans using:

  * `dirb/big.txt`
  * `seclists/raft-medium-files.txt`
  * `seclists/directory-list-lowercase-2.3-medium.txt`

Each scan result will be saved to an output file named according to the target IP and port.

---

## Example Output Files

* `nmap_10.0.0.1_port_80.txt`
* `gobuster_10.0.0.1_port_80_big.txt`
* `gobuster_10.0.0.1_port_80_raft_medium_files.txt`
* `gobuster_10.0.0.1_port_80_directory_list_lowercase_2_3_medium.txt`

---

## Screenshot

![image](https://github.com/user-attachments/assets/6d3fd5db-73e4-496a-be0e-cfde9c926062)

---

## Requirements

* Bash
* `nmap`
* `gobuster`
* Common wordlists (e.g., from [SecLists](https://github.com/danielmiessler/SecLists))

---

## Notes

* This script does not perform any advanced logic or validation beyond basic input checking.
* Ensure wordlist paths are correct on your system.
* Intended for use in lab environments or authorized penetration tests only.

