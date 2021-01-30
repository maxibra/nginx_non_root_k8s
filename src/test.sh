#!/bin/bash

URL="$(minikube ip):80"

HTTP_CODE=$($(curl -s -o /dev/null -w "%{http_code}" ${URL})

if [[ ${s} == 200 ]]; then 
    echo "The POD is running"
else 
    echo "The POD doesn't run or the site unreachable"
    exit 1
fi

curl ${URL} | sed 's:<script>\(.*\)</script>:\1:' > /tmp/script.js

current_date=$(date +' %d/%m/%Y')
site_date=$(node script.js | cut -d":" -f 2 | cut -d"," -f1)

if [[ -z "${site_date}" ]]; then
    echo "It's no date is returned"
    exit 2
elif [[ "${site_date}" == "${current_date}" ]]; then
    echo "The reponse date is right"
else 
    echo "The reponse date is WRONG"
    exit 3
fi



