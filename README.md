> [!IMPORTANT]  
> The 13.1-RELEASE is no longer available from https://download.freebsd.org/ftp/releases/amd64/. If you have it cached locally, great.
>
> If not, you would need to upgrade TrueNAS to 13.3-BETA2 or newer, and then update the version in `duplicacy.json` to 13.3-RELEASE.
> DO NOT attempt to use 13.3-RELEASE based jail with 13.2 or 13.1 host: the daemon utility this plugin relies on is incompatible and will fail to start the duplicacy service. 


This is a Duplicacy-Web plugin for TrueNAS Core.

To install: 

    curl -L https://raw.githubusercontent.com/arrogantrabbit/iocage-plugin-duplicacy/master/duplicacy.json \
         -o /tmp/duplicacy.json
    sudo iocage fetch -P /tmp/duplicacy.json

By default, duplicacy runs as root. To configure the daemon to use any other user, pass user id and group id to the iocage set command:

    sudo iocage set -P duplicacy_user=999,888 duplicacy

To get current user it's running as:
   
    sudo iocage get -P duplicacy_user duplicacy

> [!NOTE]  
> There could be a repeated output seen during installation in the console, it's a known cosmetic issue with iocage: 
>  - [reference 1](https://www.truenas.com/community/threads/is-it-true-that-each-line-of-post_install-sh-is-executed-in-parallel.93120/#post-644527)
>  - [reference 2](https://www.truenas.com/community/threads/how-to-prevent-multiple-execution-of-lines-in-post_install-sh-for-custom-plugins.95660/post-661471)
> 
