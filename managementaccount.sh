#!/bin/sh
#
# queries API to find the management account for a computer, meant to assist with FileVault 2 preparations by displaying the account in an inventory search and to be used for scoping policies
# by @emilyooo, 2014-10-08
#
# modified to use Mac's UUID for API calls, returning the General subset and simplified reading out the XML attribute

uuid=$(/usr/sbin/system_profiler SPHardwareDataType | /usr/bin/awk '/Hardware UUID/ {print $3}')

value=$(/usr/bin/curl -s -u "$username":"$password" https://jss.address.com/JSSResource/computers/udid/$uuid/subset/General | /usr/bin/xpath "//remote_management/management_username/text()" 2> /dev/null)

echo "<result>$value</result>"
