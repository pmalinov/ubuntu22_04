# ubuntu22_04
# 
#### https://www.server-world.info/en/note?os=Ubuntu_22.04&p=dhcp&f=1
### Configure DHCP ( Dynamic Host Configuration Protocol ) Server to assign IP addresses to client hosts in local network. 
### 1  	Install and Configure DHCP. On this example, it shows only for IPv4 configuration. 

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
      subnet 10.42.0.0 netmask 255.255.255.0 {
          # specify gateway
          option routers 10.42.0.1;
          # specify subnet mask
          option subnet-mask 255.255.255.0;
          # specify the range of lease IP address
          range dynamic-bootp 10.42.0.200 10.42.0.254;
          option domain-name-servers 8.8.8.8, 8.8.4.4;
      }
      #################################################à
    root@dlp:~# systemctl restart isc-dhcp-server 
    # sudo systemctl status isc-dhcp-server
    
    
#

### 
