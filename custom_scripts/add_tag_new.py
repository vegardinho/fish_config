#!/usr/bin/env python3

import re
import sys
import os

def main():
    exit_code = 0

    # Only run if enough arguments
    if len(sys.argv[2:]) == 0:
        print('Tags cannot be empty')
        sys.exit(10)

    root = sys.argv[1].replace(" ", "\\ ")
    tags = sys.argv[2:]

    delete = True if (tags[0] in ['d', 'delete']) else False

    f = open(f"{os.environ['FISH_DIR']}/conf.d/dynamic_abbr.fish", "r+")
    text = f.read()

    if delete:
        # Delete all occurences of directory
        text = re.sub(rf'.*{re.escape(root)}.*\n?(?!=abbr)', '', text)
        exit_code = 50
    else:
        for tag in tags:
            # Match root path if tag on line
            match = re.search(rf'(?<={re.escape(tag)}\s).*(?!=abbr)', text)
            if match:
                text = text.replace(match.group(), "\"{}\"".format(root)) 
            else:
                line_end = '\n'
                if text != '':
                    if (text[-1] == '\n'):
                        line_end = ''
                    # Ensure line break before and after new line
                text += "{}abbr -a -g {} \"{}\"\n".format(line_end, tag, root)

    f.seek(0)
    f.truncate(0)
    f.write(text)
    f.close()

    sys.exit(exit_code)


if __name__ == '__main__':
    main()



