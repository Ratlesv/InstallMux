#!/bin/bash
BK="\e[7m"
RT="\e[0m"
GR="\e[32m"
YW="\e[93m"



    echo -e "\n- Installing nuclei"
     #"GO111MODULE=on go install -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest > /dev/null 2>&1 && ln -s ~/go/bin/nuclei /usr/local/bin/;"
  wget https://github.com/projectdiscovery/nuclei/releases/download/v2.9.6/nuclei_2.9.6_linux_arm64.zip > /dev/null 2>&1
  unzip nuclei_2.9.6_linux_arm64.zip > /dev/null 2>&1
  chmod +x nuclei
  mv nuclei /usr/bin/
  rm nuclei_2.9.6_linux_arm64.zip
  
    if command -v nuclei &> /dev/null; then
        echo -e "${GR}SUCCESS${NORMAL}"
    else
        echo -e "${YW}FAILED${RT}"
        
 
fi
    cd ~
    echo -e "\n- Installing findomain"
    apt install unzip -y
    wget https://github.com/Findomain/Findomain/releases/download/9.0.0/findomain-aarch64.zip > /dev/null 2>&1
    unzip findomain-aarch64.zip > /dev/null 2>&1
    chmod +x findomain
    mv findomain /usr/bin/
    rm findomain-aarch64.zip

    if command -v findomain &> /dev/null; then
        echo -e "${GR}SUCCESS${NORMAL}"
    else
        echo -e "${YW}FAILED${RT}"

fi


if (( $EUID != 0 )); then
    echo -e "MAKE SURE YOU'RE ROOT BEFORE RUNNING THE SCRIPT"
    exit
fi

folders(){
    mkdir -p ~/tools
    mkdir -p ~/tools/.tmp
    mkdir -p ~/.gf
    mkdir -p ~/wordlists

}

dependencies(){
    mv .github/payloads/patterns/*.json ~/.gf/ 2> /dev/null && cd
    echo -e "${BK}INSTALLING ALL DEPENDENCIES${RT}"
    sudo apt-get update > /dev/null 2>&1
    sudo apt-get full-upgrade -y > /dev/null 2>&1
    sudo apt-get install apt-transport-https bsdmainutils build-essential snapd cmake curl dnsutils gcc git jq libdata-hexdump-perl libffi-dev libpcap-dev libssl-dev libxml2-dev libxml2-utils libxslt1-dev lynx medusa nmap procps pv python3 python3-dev wget zip zlib1g-dev libpcap-dev screen -y > /dev/null 2>&1
    
    echo -e "${GR}SUCCESS${RT}\n"
}

githubd(){
    echo -e "${BK}DOWNLOADING AND INSTALLING ALL TOOLS FROM GITHUB${RT}\n"

    echo -e "\n- Installing Sublister"
    git clone https://github.com/aboul3la/Sublist3r.git -q ~/tools/Sublist3r
    cd ~/tools/Sublist3r && sudo pip3 install -r requirements.txt > /dev/null 2>&1
    git clone https://github.com/1ndianl33t/Gf-Patterns -q && mv Gf-Patterns/*.json ~/.gf/ && rm -rf Gf-Patterns/ > /dev/null 2>&1
    if [ -s ~/tools/Sublist3r/sublist3r.py ]; then
        echo -e "${GR}SUCCESS${RT}"
    else
        echo -e "${YW}FAILED${RT}"
    
fi
    
    echo -e "\n- Installing Bhedak"
    cd && pip3 install bhedak > /dev/null 2>&1
    cd && pip3 install tldextract > /dev/null 2>&1
    which bhedak &> /dev/null && 
    if command -v bhedak &> /dev/null; then
        echo -e "${GR}SUCCESS${RT}"
    else
        echo -e "${YW}FAILED${RT}"
    fi
    
    echo -e "\n- Installing Agnee"
    sudo pip3 install git+https://github.com/R0X4R/Search-Engines-Scraper.git > /dev/null 2>&1 && sudo pip3 install agnee > /dev/null 2>&1
    if command -v agnee &> /dev/null; then
        echo -e "${GR}SUCCESS${RT}"
    else
        echo -e "${YW}FAILED${RT}"
    fi
    
    echo -e "\n- Installing uro"
    cd && pip3 install uro > /dev/null 2>&1
    if command -v uro &> /dev/null; then
        echo -e "${GR}SUCCESS${RT}"
    else
        echo -e "${YW}FAILED${RT}"
    fi
    
    echo -e "\n- Installing anew"
    go install github.com/tomnomnom/anew@latest > /dev/null 2>&1
    if [ -f ~/go/bin/anew ]; then
        echo -e "${GR}SUCCESS${RT}"
    else
        echo -e "${YW}FAILED${RT}"
    fi
    
    echo -e "\n- Installing naabu"
    go install github.com/projectdiscovery/naabu/v2/cmd/naabu@latest > /dev/null 2>&1
    if [ -f ~/go/bin/naabu ]; then
        echo -e "${GR}SUCCESS${RT}"
    else
        echo -e "${YW}FAILED${RT}"
    fi
    
    echo -e "\n- Installing gobuster"
    go install github.com/OJ/gobuster/v3@latest > /dev/null 2>&1
    if [ -f ~/go/bin/gobuster ]; then
        echo -e "${GR}SUCCESS${RT}"
    else
        echo -e "${YW}FAILED${RT}"
    fi

    echo -e "\n- Installing gf"
    go install github.com/tomnomnom/gf@latest > /dev/null 2>&1
    if [ -f ~/go/bin/anew ]; then
        echo -e "${GR}SUCCESS${RT}"
    else
        echo -e "${YW}FAILED${RT}"
    fi

    echo -e "\n- Installing gospider"
    cd && git clone https://github.com/jaeles-project/gospider ~/tools/.tmp/gospider -q
    cd ~/tools/.tmp/gospider 2> /dev/null
    go install > /dev/null 2>&1
    if [ -f ~/go/bin/gospider ]; then
        echo -e "${GR}SUCCESS${RT}"
    else
        echo -e "${YW}FAILED${RT}"
    
    fi

    echo -e "\n- Installing assetfinder"
    go install github.com/tomnomnom/assetfinder@latest > /dev/null 2>&1
    if [ -f ~/go/bin/assetfinder ]; then
        echo -e "${GR}SUCCESS${RT}"
    else
        echo -e "${YW}FAILED${RT}"
    fi
    
    go install github.com/cgboal/sonarsearch/cmd/crobat@latest > /dev/null 2>&1
    if [ -f ~/go/bin/crobat ]; then
        echo -e "${GR}SUCCESS${RT}"
    else
        echo -e "${YW}FAILED${RT}"
    fi

    echo -e "\n- Installing gau"
    go install github.com/lc/gau/v2/cmd/gau@latest > /dev/null 2>&1
    if [ -f ~/go/bin/gau ]; then
        echo -e "${GR}SUCCESS${RT}"
    else
        echo -e "${YW}FAILED${RT}"
    fi

    echo -e "\n- Installing waybackurls"
    go install github.com/tomnomnom/waybackurls@latest > /dev/null 2>&1
    if [ -f ~/go/bin/waybackurls ]; then
        echo -e "${GR}SUCCESS${RT}"
    else
        echo -e "${YW}FAILED${RT}"
    fi

    echo -e "\n- Installing kxss"
    go install github.com/Emoe/kxss@latest > /dev/null 2>&1
    if [ -f ~/go/bin/kxss ]; then
        echo -e "${GR}SUCCESS${RT}"
    else
        echo -e "${YW}FAILED${RT}"
    fi

    echo -e "\n- Installing qsreplace"
    go install github.com/tomnomnom/qsreplace@latest > /dev/null 2>&1
    if [ -f ~/go/bin/qsreplace ]; then
        echo -e "${GR}SUCCESS${RT}"
    else
        echo -e "${YW}FAILED${RT}"
    fi

    echo -e "\n- Installing ffuf"
    cd ~/tools/.tmp/ && git clone https://github.com/ffuf/ffuf -q
    cd ffuf && go install > /dev/null 2>&1
    if [ -f ~/go/bin/ffuf ]; then
        echo -e "${GR}SUCCESS${RT}"
    else
        echo -e "${YW}FAILED${RT}"
    fi

    echo -e "\n- Installing dnsx"
    go install -v github.com/projectdiscovery/dnsx/cmd/dnsx@latest > /dev/null 2>&1
    if [ -f ~/go/bin/dnsx ]; then
        echo -e "${GR}SUCCESS${RT}"
    else
        echo -e "${YW}FAILED${RT}"
    fi

    echo -e "\n- Installing notify"
    go install -v github.com/projectdiscovery/notify/cmd/notify@latest > /dev/null 2>&1
    if [ -f ~/go/bin/notify ]; then
        echo -e "${GR}SUCCESS${RT}"
    else
        echo -e "${YW}FAILED${RT}"
    fi

    echo -e "\n- Installing dalfox"
    go install github.com/hahwul/dalfox/v2@latest > /dev/null 2>&1
    if [ -f ~/go/bin/dalfox ]; then
        echo -e "${GR}SUCCESS${RT}"
    else
        echo -e "${YW}FAILED${RT}"
    fi

    echo -e "\n- Installing crlfuzz"
    cd ~/tools/.tmp/ && git clone https://github.com/dwisiswant0/crlfuzz -q
    cd crlfuzz/cmd/crlfuzz && go install > /dev/null 2>&1
    if [ -f ~/go/bin/crlfuzz ]; then
        echo -e "${GR}SUCCESS${RT}"
    else
        echo -e "${YW}FAILED${RT}"
    
    fi

    echo -e "\n- Installing subfinder"
    go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest > /dev/null 2>&1
    if [ -f ~/go/bin/subfinder ]; then
        echo -e "${GR}SUCCESS${RT}"
    else
        echo -e "${YW}FAILED${RT}"
    fi

    echo -e "\n- Installing httprobe"
    cd ~/tools/.tmp && git clone https://github.com/tomnomnom/httprobe.git -q
    cd httprobe && go install > /dev/null 2>&1
    if [ -f ~/go/bin/httprobe ]; then
        echo -e "${GR}SUCCESS${RT}"
    else
        echo -e "${YW}FAILED${RT}"
    fi

    echo -e "\n- Installing httpx"
    go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest > /dev/null 2>&1
    if [ -f ~/go/bin/httpx ]; then
        echo -e "${GR}SUCCESS${RT}"
    else
        echo -e "${YW}FAILED${RT}"
    fi

    echo -e "\n- Installing amass"
    go install -v github.com/owasp-amass/amass/v3/...@master > /dev/null 2>&1
    if [ -f ~/go/bin/amass ]; then
        echo -e "${GR}SUCCESS${RT}"
    else
        echo -e "${YW}FAILED${RT}"
    fi

    echo -e "\n- Installing gobuster"
    go install github.com/OJ/gobuster/v3@latest > /dev/null 2>&1
    if [ -f ~/go/bin/gobuster ]; then
        echo -e "${GR}SUCCESS${RT}"
    else
        echo -e "${YW}FAILED${RT}"
    fi
}

wordlistsd(){
    echo -e "\n${BK}DOWNLOADING ALL THE WORDLISTS${RT}"
    cd ~/wordlists/
    
    echo -e "\n- Downloading subdomains wordlists"
    wget -q https://raw.githubusercontent.com/danielmiessler/SecLists/master/Discovery/DNS/deepmagic.com-prefixes-top50000.txt -O subdomains.txt
    if [ -s subdomains.txt ]; then
        echo -e "${GR}SUCCESS${RT}"
    else
        echo -e "${YW}FAILED${RT}"
    fi
    
    echo -e "\n- Downloading resolvers wordlists"
    wget -q https://raw.githubusercontent.com/janmasarik/resolvers/master/resolvers.txt -O resolvers.txt
    if [ -s resolvers.txt ]; then
        echo -e "${GR}SUCCESS${RT}"
    else
        echo -e "${YW}FAILED${RT}"
    fi
    
    echo -e "\n- Downloading fuzz wordlists"
    wget -q https://raw.githubusercontent.com/Bo0oM/fuzz.txt/master/fuzz.txt -O fuzz.txt
    if [ -s fuzz.txt ]; then
        echo -e "${GR}SUCCESS${RT}"
    else
        echo -e "${YW}FAILED${RT}"
    fi
}

main(){
    folders
    dependencies
    githubd
    wordlistsd
    echo -e "\n${BK}FINISHING UP THINGS${RT}"
    rm -rf ~/tools/.tmp/ > /dev/null 2>&1
    sudo cp ~/go/bin/* /usr/bin/ > /dev/null 2>&1
    nuclei -update-templates > /dev/null 2>&1
    echo -e "\nPLEASE CONFIGURE NOTIFY API'S IN ${BK} ~/.config/notify/provider-config.yaml ${RT} FILE"
    echo -e "THANKS FOR INSTALLING ${BK}GARUD${RT}. HAPPY HUNTING :)\nPS: If you get any bug using garud, please tweet about it and tag @R0X4R, also support me on ko-fi"
    garud -h 2> /dev/null
}

while true
do
    main
    exit
done
