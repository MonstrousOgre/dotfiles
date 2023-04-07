#!/usr/bin/env python3
import argparse
import logging
import sys
import signal
import gi
import json
import html

from subprocess import run

def getPlayer():
    data = run('playerctl metadata --format {{playerName}}',capture_output=True,shell=True)
    return data.stdout.decode('ascii').strip()

def getArtist():
    data = run('playerctl metadata artist',capture_output=True,shell=True)
    return data.stdout.decode('ascii').strip()

def getTitle():
    data = run('playerctl metadata title',capture_output=True,shell=True)
    return data.stdout.decode('ascii').strip()

def main():
    artist = html.escape(getArtist())
    title = html.escape(getTitle())
    player = getPlayer()

    text = text = title if artist == "" else artist + " - " + title

    obj = {
            'text' : text,
            'tooltip' : title,
            'alt' : player,
            'class' : "custom-" + player
            }
    if title != "":
        print(json.dumps(obj))


if __name__ == '__main__':
    main()
