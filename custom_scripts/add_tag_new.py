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
    mode = sys.argv[2]
    tags = sys.argv[3:]

    if sys.argv[2][0] != '-':
        exit_code = -10
        sys.exit(exit_code)

    f = open(f"{os.environ['FISH_DIR']}/conf.d/dynamic_abbr.fish", "r+")
    text = f.read()

    if mode in ['-a', '-add']:
       for tag in tags:
        # Match root path if tag in line
        match = re.search(rf'(?<={re.escape(tag)}\s).*(?!=abbr)', text)
        if match:
            # Replace matched root with supplemented root
            text = re.sub(match.re, rf'"{root}"', text)
        else:
            line_end = '\n'
            if text != '':
                if (text[-1] == '\n'):
                    line_end = ''
                # Ensure line break before and after new line
            text += "{}abbr -a -g {} \"{}\"\n".format(line_end, tag, root)
    elif mode in ['-d', '-delete']:
        # Delete all occurences of directory
        tag_hit = ''
        if len(tags) == 1:
            tag_hit = tags[0]
        elif len(tags) > 1:
            tag_hit = rf'({"|".join(tags)})'
        if sys.argv[-1][0] == '-':
            if sys.argv[-1] != '--all':
                sys.exit(10)
        else:
            exit_code = 10
        text = re.sub(rf'abbr.*{tag_hit}\s\"{re.escape(root)}\"\n?(?!=abbr)', '', text)
        exit_code = 50
        # TODO: list what is deleted
    elif mode in ['-l', '-list']:
        groups = re.findall(rf'(?<=\s)\S+(?=\s"{re.escape(root)})', text)
        output = ['No tags stored'] if len(groups) == 0 else groups

        # Write list of tags to tmp file
        path = os.path.join(os.environ['TMPDIR'], "fish_tags_current.txt")
        with open(path, 'w') as fp:
            fp.write(', '.join(output))
        exit_code = 20
    else:
        exit_code = 10
        sys.exit(10)
    
    f.seek(0)
    f.truncate(0)
    f.write(text)
    f.close()
    sys.exit(exit_code)

if __name__ == '__main__':
    main()




