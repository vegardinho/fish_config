import os
import time

print("\nLaster tags-metadata fra mapper...\n")

def find_meta_tags(directory):
    for root, dirs, files in os.walk(directory):
        if not ".fish_tags" in files:
            continue

        meta_file = open(root + "/.fish_tags", "r")
        words = meta_file.readline().split()

        for word in words:
            abbr_file.write("\nabbr -a -g {} \"{}\"".format(word, 
                root.replace(" ", "\ ")))

        meta_file.close()

abbr_file = open("//Users/vegardlandsverk/.config/fish/conf.d/file_abbr.fish", "w")
find_meta_tags("//Users/vegardlandsverk/")

abbr_file.close()
