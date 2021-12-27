BEGIN {
    print "<html>"
    print "<body><table  border=\"8\" cellpadding=\"3\"  style=\"border-collapse: collapse\">"
    print "<tr>"
    print "<th bgcolor=turquoise colspan="6">DISK_USAGE</th>"
    print "</tr>"
    print "<tr>"
    print "<th bgcolor=gray>MOUNT</th>"
    print "<th bgcolor=gray>SIZE</th>"
    print "<th bgcolor=gray>USED</th>"
    print "<th bgcolor=gray>AVAIL</th>"
    print "<th bgcolor=gray>USE%</th>"
    print "</tr>"
}

NR > 1 {
    bgcolor=""
    if ($6+0 > 40) {
        bgcolor=" bgcolor=red"
    }
    print "<tr><td>"$2"</td><td>"$3"</td><td>"$4"</td><td>"$5"</td><td"bgcolor">"$6"</td></tr>"
}

END {
    print "</table>"
    print "</body>"
    print "</html>"
}
