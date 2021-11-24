/root/autom/checkspace.sh | awk -f help1.awk > reporthealthcheck$(date +%Y%m%d).html
/root/autom/portscan.sh | awk -f helpports.awk >> reporthealthcheck$(date +%Y%m%d).html
/root/autom/healthcheck.sh | awk -f help2.awk >> reporthealthcheck$(date +%Y%m%d).html
chmod 777 reporthealthcheck$(date +%Y%m%d).html
sed -i -e 's/\x1b//g' reporthealthcheck$(date +%Y%m%d).html
sed -i -e 's/;//g' reporthealthcheck$(date +%Y%m%d).html
sed -i -e 's/\[//g' reporthealthcheck$(date +%Y%m%d).html
sed -i -e 's/<pre>134m\*0m App Healthcheck 134m\*0m<\/pre>/<pre> App Healthcheck <\/pre>/g' reporthealthcheck$(date +%Y%m%d).html
sed -i -e 's/<pre>134m/<pre style="color:blue;">/g' reporthealthcheck$(date +%Y%m%d).html
sed -i -e 's/0m<\/pre>/<\/pre>/g' reporthealthcheck$(date +%Y%m%d).html
sed -i -e 's/<pre>032m/<pre style="color:green;">[/g' reporthealthcheck$(date +%Y%m%d).html
sed -i -e 's/<pre>031m/<pre style="color:red;">[/g' reporthealthcheck$(date +%Y%m%d).html
sed -i -e 's/<pre>Services\]<\/pre>/<pre>\[Services\]<\/pre>/g' reporthealthcheck$(date +%Y%m%d).html
python3 mailreporting.py