This is a Duplicacy-Web plugin for TrueNAS Core.

To install: 

    curl -L https://raw.githubusercontent.com/arrogantrabbit/iocage-plugin-duplicacy/master/duplicacy.json -o /tmp/duplicacy.json
    sudo iocage fetch -P /tmp/duplicacy.json

By default, duplicacy runs as root. To configure the daemon to use any other user, pass user id and group id to the iocage set command:

    sudo iocage set -P duplicacy_user=999,888 duplicacy

To get current user it's running as:
   
    sudo iocage get -P duplicacy_user duplicacy
