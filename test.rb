#!/usr/bin/env ruby

# This script will pull changes from the remote for each git repository in the directory we call it from

# Delete this directory and the parent directory from the list
system('git config --global credential.helper cache')