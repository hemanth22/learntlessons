/root/checkspace.sh | awk -f stat.awk > report$(date +%Y%m%d).html
cat mailheaderautomation report$(date +%Y%m%d).html | sendmail -t
