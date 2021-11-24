BEGIN {
    print "<h1>Services status</h1>"
}
NR > 1 {
    print "<pre>"$0"</pre>"
}
END {
    print "</body></html>"
}