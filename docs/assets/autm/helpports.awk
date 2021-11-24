BEGIN {
    print "<br/>"
    print "<table  border=\"8\" cellpadding=\"3\"  style=\"border-collapse: collapse\">"

    print "<tr>"
    print "<th bgcolor=turquoise colspan="6">PORT AVAILABILITY</th>"
    print "</tr>"
    print "<tr>"
    print "<th bgcolor=gray>Protocol</th>"
    print "<th bgcolor=gray>IP Address and Port</th>"
    print "<th bgcolor=gray>Status</th>"
    print "</tr>"
}

NR > 0 {
    print "<tr><td>"$1"</td><td>"$4"</td><td>"$6"</td></tr>"
}

END {
    print "</table>"
}