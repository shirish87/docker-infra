#!/bin/bash -e

ANSIBLE_HOST_KEY_CHECKING=True ansible-playbook -i hosts site.yml
