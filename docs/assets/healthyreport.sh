/root/checkspace.sh | awk -f help1.awk > reporthealthcheck$(date +%Y%m%d).html
/root/healthcheck.sh | awk -f help2.awk >> reporthealthcheck$(date +%Y%m%d).html
chmod 777 reporthealthcheck$(date +%Y%m%d).html
sed -i -e 's/\x1b//g' reporthealthcheck20211031.html
sed -i -e 's/;//g' reporthealthcheck20211031.html
sed -i -e 's/\[//g' reporthealthcheck20211031.html
sed -i -e 's/<pre>134m\*0m Process Healthcheck 134m\*0m<\/pre>/<pre>* Process Healthcheck *<\/pre>/g' reporthealthcheck20211031.html
sed -i -e 's/<pre>134m/<pre bgcolor=blue>/g' reporthealthcheck20211031.html
sed -i -e 's/0m<\/pre>/<\/pre>/g' reporthealthcheck20211031.html
sed -i -e 's/<pre>032m/<pre bgcolor=green>/g' reporthealthcheck20211031.html
sed -i -e 's/<pre>031m/<pre bgcolor=green>/g' reporthealthcheck20211031.html
python3 mailreporting.py
