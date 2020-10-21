"""
den_backup.py

little overengineered too fancy backup utility
"""

import argparse
import os.path
import shutil
import subprocess
import yaml

CONFIG_PATH = os.path.expanduser('~/.config/backups.yml')

SKIP_DIRS = ['.tls', '.ssh']

def main():

    parser = argparse.ArgumentParser()
    parser.add_argument('--setup')


    

def setup():
    """
    Create the initial backup config