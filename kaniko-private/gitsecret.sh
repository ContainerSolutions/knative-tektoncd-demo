#!/bin/bash
#Script to create the necessary secret and service account to authenticate with a private Git repository. Replace the private-key-path with your own private github key.

knctl ssh-auth-secret create -s git --github --private-key-path ~/.ssh/id_rsa
knctl service-account create -a builder-ssh -s git1 -s gcr-creds