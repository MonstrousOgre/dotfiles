#!/usr/bin/env python3
import json
from subprocess import run

data = run("hyprctl monitors -j",capture_output=True,shell=True)

monitors = json.loads(data.stdout)

for monitor in monitors:
    if(monitor["focused"]):
        print(monitor["name"])
