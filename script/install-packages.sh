#!/bin/sh

#Installs linux packages defined in ./packages.txt file to ./servers.txt file 


server_list="./servers.txt"
package_list="./packages.txt"
ssh_user_name=root
if [ -z "$server_list"]
then
    printf("your servers.txt is empty or missing. Please check if it's there.")
else
    printf("Checking Servers accessibility")
    for i in $server_list; do
        if ping -c 1 $i
            then
                printf("$i is accessible.")
            else
                printf("$i is not accessible")
                exit 1;
        fi
fi

if [ -z "$package_list"]
then
    printf("package.txt is empty or missing. Please check if it's there.")
else
    printf("Installing packages")
    for i in $server_list; do
        for j in $package_list; do
        ssh ${ssh_user_name}@$i 'bash -s' < dnf install $j -y

fi