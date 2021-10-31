cat <<'EOF' - reporthealthcheck$(date +%Y%m%d).html | /usr/sbin/sendmail -t
To: to@address
Subject: hello
Content-Type: text/html
EOF
