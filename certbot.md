# download
```sh
git clone https://github.com/certbot/certbot
```

# single domain
```sh
cd certbot
printf "Domain: " && read DOMAIN && ./certonly-auto certonly -d $DOMAIN
```

# wild card
```sh
cd certbot
printf "Domain: " && read DOMAIN && ./certbot-auto certonly --manual -d *.$DOMAIN -d $DOMAIN --agree-tos --manual-public-ip-logging-ok --preferred-challenges dns-01 --server https://acme-v02.api.letsencrypt.org/directory --register-unsafely-without-email --rsa-key-size 4096
```
