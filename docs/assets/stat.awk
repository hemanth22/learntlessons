BEGIN {
    print "<html><body><table  border=\"8\" cellpadding=\"3\"  style=\"border-collapse: collapse\">"

    print "<tr>"
    print "<th bgcolor=turquoise colspan="6">BEFORE_USAGE</th>"
    print "</tr>"
    print "<tr>"
    print "<th bgcolor=gray>MOUNT</th>"
    print "<th bgcolor=gray>SIZE</th>"
    print "<th bgcolor=gray>USED</th>"
    print "<th bgcolor=gray>AVAILABLE</th>"
    print "<th bgcolor=gray>USE%</th>"
    print "</tr>"
}

NR > 1 {
    bgcolor=""
    if ($5+0 > 70) {
        bgcolor=" bgcolor=azure"
    }
    print "<tr><td>"$6"</td><td>"$2"</td><td>"$3"</td><td>"$4"</td><td"bgcolor">"$5"</td></tr>"
}

END {
    print "</table></body></html>"
}