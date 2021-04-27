#!/bin/sh

export PATH=$PATH:/usr/local/bin
pip3 install  pytest
python3 -m pytest
