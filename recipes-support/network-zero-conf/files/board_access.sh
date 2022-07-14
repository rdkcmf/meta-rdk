
# Add public dns servers to /etc/resolv.dnsmasq [ Ideally this would be set by DHCP clients ]
RESOLV_CONF_FILE="/etc/resolv.dnsmasq"
# Add google dns servers to the list
echo "nameserver 2001:4860:4860::8888" >> $RESOLV_CONF_FILE
echo "nameserver 2001:4860:4860::8844" >> $RESOLV_CONF_FILE
echo "nameserver 8.8.8.8" >> $RESOLV_CONF_FILE    
echo "nameserver 8.8.4.4" >> $RESOLV_CONF_FILE 

# Start dropbear with read-write mount of /et/dropbear and listen on all interfaces
mount-copybind /tmp/dropbear /etc/dropbear/

dropbear -v -R -B -p :22
