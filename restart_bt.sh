
#!/bin/zsh

rfkill block bluetooth
sleep 1
systemctl restart bluetooth.service

