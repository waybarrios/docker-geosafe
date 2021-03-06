#!/usr/bin/env bash

cp -n /celeryconfig.py /home/src/inasafe/headless/celeryconfig.py

start-stop-daemon --start -b -x /usr/bin/Xvfb :99
source run-env-linux.sh /usr
celery -A headless.celery_app worker -l info -Q inasafe-headless -n inasafe-headless.%h
