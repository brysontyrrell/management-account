#!/bin/sh

# managementaccount.sh
#
# queries API to find the management account for a computer, meant to assist with FileVault 2 preparations by displaying the account in an inventory search and to be used for scoping policies
#
# by @emilyooo, 2014-10-08



value=$(curl -s -u user:password https://companyjss:8443/JSSResource/computers/macaddress/$(networksetup -getmacaddress en0 | awk '{print $3}' | sed 's/:/./g') | xpath "//computer/general/remote_management/management_username[1]" | sed -e 's/<management_username>//;s/<\/management_username>//')
echo $value
