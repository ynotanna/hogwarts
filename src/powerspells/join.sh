#!/bin/bash

while true
do
    read -p 'Username: ' uservar
    if id $uservar >/dev/null 2>&1; then
        echo "user exists. Please choose another name"
    else
        echo "user does not exist. create a password"
	read -sp 'Password: ' passvar
        useradd -m -d /magical_world/hogwarts/dorms/$uservar -s /bin/bash $uservar
        echo $uservar:"$passvar" | chpasswd
        touch /magical_world/hogwarts/dorms/$uservar/.bashrc
        echo 'PATH=$PATH:/usr/local/bin/hogwarts' >> /magical_world/hogwarts/dorms/$uservar/.bashrc
        echo "You are all setup, exit (by typing exit and then enter) and then use ssh $uservar@hogwarts.ai"
        break
    fi
done