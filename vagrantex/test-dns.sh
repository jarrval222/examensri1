#!/bin/bash
#
# Test script for DNS. ADAPT to your needs.
#
# Author: Fernando Raya
# Requires: dig
#
# USAGE: ./test.sh <nameserver-ip>
#
DOMAIN="javi.test"

# Exit if any command fails
set -euo pipefail

function resolver () {
    echo "dig $nameserver +noall +answer $@"
    dig $nameserver +noall +answer $@
}

function resolver-x () {
    echo "dig $nameserver +noall +answer -x $@"
    dig $nameserver +noall +answer -x $@
}

nameserver=@$1

resolver dns.$DOMAIN
resolver dhcp.$DOMAIN
resolver web.$DOMAIN
resolver www.$DOMAIN
resolver mail.$DOMAIN
resolver $DOMAIN mx
resolver-x 192.168.57.20
resolver-x 192.168.57.10
resolver-x 192.168.57.11
resolver-x 192.168.57.12
