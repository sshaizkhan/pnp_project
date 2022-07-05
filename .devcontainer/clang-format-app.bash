#!/bin/bash
source /home/bot/.bashrc

find /home/bot/pick_and_place_ws/ -iname *.hh -o -iname *.cc | xargs /usr/bin/clang-format -style=file
