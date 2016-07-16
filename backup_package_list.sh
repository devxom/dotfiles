#!/bin/bash
dnf list installed | awk '{print $1}' > package_list.txt
