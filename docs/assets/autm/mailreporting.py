#!/usr/bin/env python3
# import the necessary components first
import smtplib
import subprocess
from email.mime.text import MIMEText
from email.mime.multipart import MIMEMultipart
reporterhtml = subprocess.getoutput("cat /root/autom/reporthealthcheck$(date +%Y%m%d).html")
sender_email = "mailtrap@example.com"
receiver_email = "new@example.com;hemanthbitra@bitroid.in"
message = MIMEMultipart("alternative")
message["Subject"] = "Health Check for server"
message["From"] = sender_email
message["To"] = receiver_email
# write the plain text part
text = reporterhtml
# write the HTML part
html = reporterhtml
# convert both parts to MIMEText objects and add them to the MIMEMultipart message
part1 = MIMEText(text, "plain")
part2 = MIMEText(html, "html")
message.attach(part1)
message.attach(part2)
# send your email
with smtplib.SMTP("193.16.16.10", 1025) as server:
    #server.login(login, password)
    server.sendmail(
        sender_email, receiver_email, message.as_string()
    )
print('Sent')