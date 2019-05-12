#!/bin/bash -e

ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i hosts site.yml
