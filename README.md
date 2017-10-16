# helper-scripts

#### Symbolic links to all scripts have been added to my */usr/local/sbin* folder since they all need to be run as *sudo*

##### The following scripts are used to set the power mode of the cpu
  * ondemand_set
  * performance_set
  * powersave_set

##### The following script is used to restart the bluetooth client when no devices are shown in the devices list
  * restart_bt

##### To add battery percentage and charging status, as well as CPU frequency see below
Add the code below to your **_.zshrc_** or adapt to your equivalent terminal to get the status bar shown in the image below, the code updates the status every 1s.

![alt text](https://github.com/clu83/helper-scripts/blob/master/command_line_charge_status.png "terminal with cpu/battery status")

Change the folder locations to where you've placed the **battery_percent.sh** script.


```bash
fpath=('.zsh/functions/' $fpath)
TMOUT=1

TRAPALRM() {
	RPROMPT="$(~/.zsh/functions/battery_percent)"

	cat /proc/cpuinfo | grep "cpu MHz" | sed ':a;N;$!ba;s/\n/ /g' | egrep -o '[[:digit:]]{1,4}\.[0]{1}' | sed ':a;N;$!ba;s/\n/ /g' | read CPU1 CPU2

	RPROMPT+=" CPU:%B%F{blue}$CPU1/$CPU2%f%b / %*"
	
	zle reset-prompt

}
```
