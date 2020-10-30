"""
den_backup.py

little overengineered too fancy backup utility
"""

import argparse
import os.path
import shutil
import subprocess
import yaml

# Other to ignores:
# snap/spotify/common/.cache/
# skip git repos with no local changes


# one copy, updated:
# Virtualbox stuff

CONFIG_PATH = os.path.expanduser('~/.config/backups.yml')

SKIP_DIRS = ['.tls', '.ssh']

def main():

    parser = argparse.ArgumentParser()
    parser.add_argument('--setup')


    # ToDo maybe move setup to setup.py

def setup():
    """
    Create the initial backup config