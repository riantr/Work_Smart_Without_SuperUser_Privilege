#!/bin/bash
aptitude download $(<need_to_download)
rm -rf need_to_download
touch need_to_download
