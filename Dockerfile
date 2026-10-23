FROM nginx:alpine

RUN apk add --no-cache curl wget jq unzip tar

WORKDIR /var/www/linuxcore.site

RUN wget --mirror --convert-links --adjust-extension --page-requisites --no-parent --no-host-directories -P /var/www/linuxcore.site/ https://linuxcore.site/ || true

RUN mkdir -p /var/www/linuxcore.site/db/

RUN API_URL="https://api.github.com/repos/nisamov/linuxcore/releases/latest" && \
    ASSETS_URLS=$(curl -s $API_URL | jq -r '.assets[].browser_download_url') && \
    for url in $ASSETS_URLS; do \
        echo "Descargando $url..."; \
        curl -L -o /tmp/asset_tmp "$url"; \
        if file /tmp/asset_tmp | grep -q 'Zip archive'; then \
            unzip -o /tmp/asset_tmp -d /var/www/linuxcore.site/db/ && rm /tmp/asset_tmp; \
        elif file /tmp/asset_tmp | grep -q 'gzip compressed data'; then \
            tar -xzf /tmp/asset_tmp -C /var/www/linuxcore.site/db/ --strip-components=1 2>/dev/null || \
            tar -xzf /tmp/asset_tmp -C /var/www/linuxcore.site/db/ && rm /tmp/asset_tmp; \
        else \
            filename=$(basename "$url"); \
            mv /tmp/asset_tmp "/var/www/linuxcore.site/db/$filename"; \
        fi; \
    done

RUN echo 'server {' > /etc/nginx/conf.d/default.conf && \
    echo '    listen 80;' >> /etc/nginx/conf.d/default.conf && \
    echo '    server_name localhost;' >> /etc/nginx/conf.d/default.conf && \
    echo '    root /var/www/linuxcore.site;' >> /etc/nginx/conf.d/default.conf && \
    echo '    index index.html index.htm;' >> /etc/nginx/conf.d/default.conf && \
    echo '    location / {' >> /etc/nginx/conf.d/default.conf && \
    echo '        try_files $uri $uri/ =404;' >> /etc/nginx/conf.d/default.conf && \
    echo '    }' >> /etc/nginx/conf.d/default.conf && \
    echo '}' >> /etc/nginx/conf.d/default.conf

RUN chown -R nginx:nginx /var/www/linuxcore.site

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
