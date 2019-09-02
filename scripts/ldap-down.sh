#!/bin/sh

set -e

OPENLDAP_CONTAINER="$(docker ps -f name=my-openldap-container -q)"
PHPLDAPADMIN_CONTAINER="$(docker ps -f name=my-phpldapadmin-container -q)"

if [ -n "${OPENLDAP_CONTAINER}" ]; then
    docker stop "${OPENLDAP_CONTAINER}"
    docker rm "${OPENLDAP_CONTAINER}"
else
    echo "No Open LDAP container to remove"
fi

if [ -n "${PHPLDAPADMIN_CONTAINER}" ]; then
    docker stop "${PHPLDAPADMIN_CONTAINER}"
    docker rm "${PHPLDAPADMIN_CONTAINER}"
else
    echo "No PHP LDAP Admin container to remove"
fi

set +e
