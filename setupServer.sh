#! /bin/bash
clear


printf "\033[0;31mThis script MUST be run using sudo. Please restart if it is not\033[0m \n"

# prompts user if they want to update + upgrade the server
upgrade_server () {
	printf "Update and Upgrade the Ubuntu Server?\n"
	read -p "(y/n): " upgradeServer
	if [ "$upgradeServer" == "y" ] || [ "$upgradeServer" == "Y" ] || [ "$upgradeServer" == "yes" ];
	then
		printf "Updating server...\n"
		#apt-get update
		printf "Done.\n"
		printf "Upgrading server...\n"
		#apt-get upgrade
		printf "Done.\n"
	elif [ "$upgradeServer" == "n" ] || [ "$upgradeServer" == "N" ] || [ "$upgradeServer" == "no" ];
	then
		printf "Skipping server update and upgrade.\n"
	else
		printf "Not a valid input.\n"
		upgrade_server
	fi
}

upgrade_server #Call the function for the 1st time


printf "\nWe are now going to setup the server with different tools.\n"

#Lists tools and prompts for item removals
tools_list () {
	printf "#########################################################################
\033[0;35mTools List\033[0m:
Language:
	L1. Python3 (includes pip)
	L2. JavaScript (includes node + npm)
Framework:
	F1. Flask (Python)
	F2. Express (JS)
	F3. React (JS)
Database:
	D1. MongoDB (drivers included if Python3 or Node.js are selected)
	D2. MySQL
Other:
	O1. NGINX 
	O2. Apache
	O3. TensorFlow (python or JS based on selections)
	04. Scikit-learn (python or JS (scikit-node) based on selections)
#########################################################################
	"
	printf "Would you like to remove any from the list? \n"
	read -p "(y/n): " remove
	if [ "$remove" == "y" ] || [ "$remove" == "Y" ] || [ "$remove" == "yes" ];
	then
		printf "Which tool would you like to remove? (ex: 'F2' for Express, Only enter 1)\n"
		read -p "##: " RM
		printf "Removing $RM from the list...\n"
	elif [ "$remove" == "n" ] || [ "$remove" == "N" ] || [ "$remove" == "no" ];
	then 
		printf "Proceeding to install all tools in the list.\n"
		install
	else 
		printf "Not a valid choice\n"
		tools_list
	fi
}

tools_list # calls tools_list for the 1st time

install_python3 () {
        printf "installing Python3...\n"
	# apt-get install python3.6
        if (python --version) || (python3 --version);
        then
                printf "\033[0;32mPython3 successfully installed!\033[0m \n"
                if (pip --version) || (pip3 --version) ;
                then
                        printf "\033[0;32mpip successfully installed!\033[0m \n"
                else
                        printf "\033[0;31mpip failed to install!\033[0m \n"
                fi
        else
                printf "\033[0;31mPython3 failed to install!\033[0m \n"
        fi
}
install_nodejs () {
        printf "installing Node.js...\n"
	# apt-get install nodejs
        if (nodejs -v) ;
        then
                printf "\033[0;32mNode.js successfully installed!\033[0m \n"
		#apt-get install npm
                if (npm -v) ;
                then
                        printf "\033[0;32mnpm successfully installed!\033[0m \n"
                else
                        printf "\033[0;31mnpm failed to install!\033[0m \n"
                fi
        else
                printf "\033[0;31mNode.js failed to install!\033[0m \n"
		printf "\033[0;31mnpm failed to install!\033[0m \n"

        fi
}
install_flask () {
	printf "installing Flask (Python)...\n"
	#pip install Flask
	if (pip install Flask);
	then
		printf "\033[0;32mFlask successfully installed!\033[0m \n"
	else
		printf "\033[0;31mFlask failed to install!\033[0m \n"
	fi
}
install_express () {
	printf "installing Express (JS)...\n"












