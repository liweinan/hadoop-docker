#!/usr/bin/env bash
ssh -t -p 2122 -L 5900:localhost:5900 root@0.0.0.0 'x11vnc -create -display :0'
