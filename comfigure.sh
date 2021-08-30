#!/bin/bash
Setup () {
	rm -r $HOME/sources 2> /dev/null
	mkdir $HOME/sources
	export J=$(/usr/bin/nproc)
	export SRC_PATH=$HOME/sources
}
Wget () {
	sudo apt install libssl-dev linux-headers-$(uname -r)
	cd $SRC_PATH
	wget https://ftp.gnu.org/gnu/wget/wget-1.21.1.tar.gz
	tar xf wget-1.21.1.tar.gz
       	cd $SRC_PATH/wget-1.21.1/ && ./configure --prefix=/opt/wget --sysconfdir=/etc  --with-ssl=openssl
	cd $SRC_PATH/wget-1.21.1/ && make -j$J
       	cd $SRC_PATH/wget-1.21.1/ && sudo make -j$J install
	sudo apt purge libssl-dev linux-headers-$(uname -r)
}

Setup
Wget
