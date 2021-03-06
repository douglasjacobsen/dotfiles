#########################################################################################
#      Set Info for Mounting and Aliasing to Desktop at home            #
#########################################################################################

#INTELVPN_DOMAIN='10.255.'
INTELWORK_DOMAIN='10.50.'
LANLWORK_DOMAIN='130.55.'
WORKIP="none"

OS=`uname`
IO="" # store IP
case $OS in
  Linux) IP=`ifconfig  | grep 'inet addr:'| grep -v '127.0.0.1' | cut -d: -f2 | awk '{ print $1}'`;;
  FreeBSD|OpenBSD) IP=`ifconfig  | grep -E 'inet.[0-9]' | grep -v '127.0.0.1' | awk '{ print $2}'` ;;
  SunOS) IP=`ifconfig -a | grep inet | grep -v '127.0.0.1' | awk '{print $2} '` ;;
  *) IP="Unknown";;
esac

IPS=`echo $IP | tr " " "\n"`

for IP in $IPS
do
  LANL_TEST=`echo ${IP} | grep "${LANLWORK_DOMAIN}"`
  INTELWORK_TEST=`echo ${IP} | grep "${INTELWORK_DOMAIN}"`

  if [ -n "${LANL_TEST}" ]; then
    WORKIP="lanl"
    break
  elif [ -n "${INTELWORK_TEST}" ]; then
    WORKIP="intel"
    break
  else # Test for Intel VPN
    NSLOOKUP=`nslookup ${IP} | grep "name =" | grep "intel"`
    if [ -n "${NSLOOKUP}" ]; then
      WORKIP="intel"
      break
    fi
  fi
done

case $WORKIP in
  "lanl") export http_proxy="http://proxyout.lanl.gov:8080"
    export https_proxy="http://proxyout.lanl.gov:8080"
    export ftp_proxy="http://proxyout.lanl.gov"
    export no_proxy="*.lanl.gov"
#   cp ~/.subversion/servers.lanl ~/.subversion/servers
    cat ~/.ssh/config | sed "s|ProxyCommand.*|ProxyCommand None|g" > ~/.ssh/.tmp
    mv ~/.ssh/.tmp ~/.ssh/config
    git config --global http.proxy $http_proxy
    gsettings set org.gnome.system.proxy mode 'auto'
    gsettings set org.gnome.system.proxy autoconfig-url 'http://wpad.lanl.gov/wpad.dat'
    ;;
  "intel") export http_proxy="http://proxy-chain.intel.com:911"
    export https_proxy="http://proxy-chain.intel.com:911"
    export ftp_proxy="http://proxy-chain.intel.com:911"
    export no_proxy="*.intel.com"
    cat ~/.ssh/config | sed "s|ProxyCommand.*|ProxyCommand /usr/local/bin/socks-gateway %h %p|g" > ~/.ssh/.tmp
    mv ~/.ssh/.tmp ~/.ssh/config
#   cp ~/.subversion/servers.lanl ~/.subversion/servers
    git config --global http.proxy $http_proxy
    gsettings set org.gnome.system.proxy mode 'auto'
    gsettings set org.gnome.system.proxy autoconfig-url 'http://autoproxy.intel.com'
    ;;

  *) unset http_proxy
    unset https_proxy
    unset ftp_proxy
    unset no_proxy
    unset all_proxy
#   cp ~/.subversion/servers.nolanl ~/.subversion/servers
    cat ~/.ssh/config | sed "s|ProxyCommand.*|ProxyCommand None|g" > ~/.ssh/.tmp
    mv ~/.ssh/.tmp ~/.ssh/config
    git config --global http.proxy ""
    gsettings set org.gnome.system.proxy mode 'none'
    ;;
esac

