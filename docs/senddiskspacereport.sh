/root/checkspace.sh | awk -f stat.awk > report$(date +%Y%m%d).html
cat mailheader report$(date +%Y%m%d).html | sendmail -t
