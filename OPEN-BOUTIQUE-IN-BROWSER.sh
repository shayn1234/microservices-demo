#!/bin/bash

echo "See logs at OPEN-BOUTIQUE-IN-BROWSER.log"
( set -x ; minikube service frontend-external ) > OPEN-BOUTIQUE-IN-BROWSER.log 2>&1 &
disown
