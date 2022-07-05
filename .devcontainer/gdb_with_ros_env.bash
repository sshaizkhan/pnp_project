#!/bin/bash

# Source our environment
source /home/bot/pick_and_place_ws/install/setup.bash

# Run gdb, forwarding all args through
/usr/bin/gdb ${@}
