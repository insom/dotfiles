require ["fileinto", "reject", "envelope", "body", "imap4flags"];

if anyof(
    exists ["X-SG-EID"], 
    exists ["X-Business-Group"],
    exists ["X-Auto-Response-Suppress"],
    exists ["X-Automattic-Destination"],
    exists ["X-Uber-Id"],
    exists ["X-Mailgun-Sid"],
    exists ["X-Report-Abuse"],
    exists ["List-Unsubscribe"]) {
    setflag "\\Seen";
    fileinto "Promo";
} elsif anyof(
    address :is :all "from" "registration-inscription@pwlcapital.com",
    address :is :domain "from" "acm.org",
    address :is :domain "from" "m.redbubble.com",
    address :is :domain "from" "notice.aliexpress.com",
    address :is :domain "from" "info.aliexpress.com",
    address :is :domain "from" "fosiaudio.com",
    address :is :domain "from" "inclusion.ca",
    address :is :domain "from" "mail.aircanada.com",
    address :is :domain "to" "pkgsrc.org",
    address :is :domain "to" "netbsd.org") {
    setflag "\\Seen";
    fileinto "Promo";
}
