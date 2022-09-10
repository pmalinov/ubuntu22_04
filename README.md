# ubuntu Mate 22.04
# 
#### https://www.server-world.info/en/note?os=Ubuntu_22.04&p=dhcp&f=1
### Configure DHCP ( Dynamic Host Configuration Protocol ) Server to assign IP addresses to client hosts in local network. 
### 	Install and Configure DHCP. On this example, it shows only for IPv4 configuration. 

     root@dlp:~# apt -y install isc-dhcp-server
    root@dlp:~# vi /etc/default/isc-dhcp-server
    # line 4 : uncomment

    DHCPDv4_CONF=/etc/dhcp/dhcpd.conf
    # line 17 : specify interface to listen (replace it to your environment)

    INTERFACESv4="enp1s0
    "
    root@dlp:~# vi /etc/dhcp/dhcpd.conf     # or sudo gedit /etc/dhcp/dhcpd.conf
    # line 10 : specify domain name

    option domain-name "srv.world"
    ;
    # line 11 : specify nameserver's hostname or IP address

    option domain-name-servers dlp.srv.world
    ;
    # line 24 : uncomment (this DHCP server to be declared valid)

    authoritative;
    # add to the end

    # specify network address and subnetmask

      ###############################################
          Define the DHCP network IP range.
        IP range
        gateway/router address
        domain name servers
        domain names
      ##############
      subnet 10.42.0.0 netmask 255.255.255.0 {
          # specify gateway
          option routers 10.42.0.1;
          # specify subnet mask
          option subnet-mask 255.255.255.0;
          # specify the range of lease IP address
          range dynamic-bootp 10.42.0.200 10.42.0.254;
          option domain-name-servers 8.8.8.8, 8.8.4.4;
      }
      #################################################
    root@dlp:~# systemctl restart isc-dhcp-server 
    # sudo systemctl status isc-dhcp-server
    
    
#

### 


### Open DHCP Server Ports on Firewall
#### Allow DHCP port on firewall.
     sudo ufw allow  67/udp
#### Restart DHCP server to apply changes.     
     sudo systemctl restart isc-dhcp-server.service
     sudo systemctl status isc-dhcp-server
     # tail -f /var/log/dhcpd.log
# 





###  commands - utility   
     ### remove # sudo apt remove brasero -y
     # install 
     sudo apt-get install -y synaptic gdebi ppa-purge\
     x11vnc net-tools ssh gedit vnstat gfwu wavemon \ 
     brasero acetoneiso vlc \
       
    sudo apt install ubuntu-restricted-extras p7zip-full p7zip-rar
    sudo apt install fonts-crosextra-caladea fonts-crosextra-carlito
    
   # for DVD
   sudo apt install libdvd-pkg
   sudo dpkg-reconfigure libdvd-pkg
   # sudo apt install dnsmasq
   # apt -y install isc-dhcp-server


#### How do I disable the boot splash screen
     sudo su -
     #edit
     sudo gedit /etc/default/grub
     ####GRUB_CMDLINE_LINUX_DEFAULT="quiet splash"
     GRUB_CMDLINE_LINUX_DEFAULT
     sudo update-grub

#### Cleen SWAP
    sudo swapoff -a
    sudo swapon -
     
     sudo systemctl enable vnstat.service && \
     sudo systemctl start vnstat.service  && \
     sudo systemctl status vnstat.service
     
     # Network
      #
     nmcli c show
     netstat -rn
     route -n
     netstat -rn
     route -n
     ip route

     sudo nmcli networking off
     sudo nmcli networking on
     sudo systemctl restart NetworkManager.service
     
#####  How to Modify Laptop Close Behavior in Ubuntu with HandleLidSwitch
     sudo gedit /etc/systemd/logind.conf
     ####HandleLidSwitch=suspend
     ####HandleLidSwitchExternalPower=suspend
     HandleLidSwitch=ignore
     HandleLidSwitchExternalPower=ignore
     reboot
     
#### How to disable/enable GUI in Ubuntu 22.04 Jammy Jellyfish Linux Desktop
     sudo systemctl set-default multi-user
     reboot
     #sudo systemctl stop lightdm
     #sudo systemctl start lightdm
     
#### How to enable GUI to start on boot
     sudo systemctl set-default graphical
     sudo systemctl start lightdm



     
