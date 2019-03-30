#!/bin/bash
ls | grep amd64.deb >debs
ls | grep all.deb >>debs
cat debs
