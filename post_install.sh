#!/bin/sh

CONFIGPATH=/root/.duplicacy-web

if [ ! -f /root/settings.json ]; then

  echo "Configuration file does not exist."
  echo "Creating default one enabling listening on all interfaces"

  mkdir -p ${CONFIGPATH}

  cat >${CONFIGPATH}/settings.json <<EOF
{
    "listening_address"     : "0.0.0.0:3875"
}
EOF

else

  echo "Setting listening_address to 0.0.0.0:3875"
  sed -i "s/\"listening_address\"\s*:\s*\".*\"/\"listening_address\" : \"0\.0\.0\.0:3875\"/g" ${CONFIGPATH}/settings.json

fi

sysrc duplicacy_runas="root"

NETWAIT_IP=1.1.1.1

echo "Configuring netwait to wait for ${NETWAIT_IP}"
sysrc netwait_ip="${NETWAIT_IP}"

echo "Enabling netwait and newsyslog services"
service newsyslog enable
service netwait enable

service duplicacy enable

echo "Downloading duplicacy executable and starting service"

/usr/local/bin/duplicacy-updater oneshot

echo "Starting duplicacy updater"
service duplicacyupd enable
service duplicacyupd start

echo "Ready"

