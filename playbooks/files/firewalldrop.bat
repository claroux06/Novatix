@echo off
set IP=%1
echo Blocking IP %IP% >> "C:\Program Files (x86)\ossec-agent\active-response.log"
netsh advfirewall firewall add rule name="Wazuh Block %IP%" dir=in action=block remoteip=%IP%
