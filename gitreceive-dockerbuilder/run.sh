#!/bin/bash
set -e

export DOCKER_HOST='tcp://docker:2375'

/usr/sbin/sshd -D
