#!/usr/bin/python3

import os
import time
import sys

skip_dirs = []

def find_meta_tags(directory, skip_dirs, abbr_file):
    print("\nLaster tags-metadata fra mapper...\n")

    for root, dirs, files in os.walk(directory):
        if (not ".fish_tags" in files) or (root in skip_dirs):
            continue

        f_name = root + "/.fish_tags"
        os.remove(f_name)
        print("Removed: " + f_name)

        # meta_file = open(root + "/.fish_tags", "r")
        # words = meta_file.readline().split()
        # print("{} – {}".format(words, root))

        # for word in words:
        #     abbr_file.write("\nabbr -a -g {} \"{}\"".format(word, 
        #         root.replace(" ", "\\ ")))

        #meta_file.close()


def main():
    if len(sys.argv) > 1 and sys.argv[1] == 'external':
        file_mode = 'a'
        start_dir = '/Volumes'
        skip_dirs.append('Macintosh HD')
    else:
        file_mode = 'w'
        start_dir = "/Users/vegardlandsverk/"

    abbr_file = open("/Users/vegardlandsverk/.config/fish/conf.d/dynamic_abbr.fish", file_mode)
    find_meta_tags(start_dir, skip_dirs, abbr_file)

    abbr_file.close()

main()
