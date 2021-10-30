/root/checkspace.sh | awk -f help1.awk > reporthealthcheck$(date +%Y%m%d).html
/root/healthcheck.sh | awk -f help2.awk >> reporthealthcheck$(date +%Y%m%d).html
chmod 777 reporthealthcheck$(date +%Y%m%d).html
python3 mailreporting.py