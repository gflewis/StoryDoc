import sys

def process(fname):
    with open(fname, 'r') as infile:
        for line in infile:
            if line[0:9].upper() == '#INCLUDE ':
                process(line[9:].rstrip())
            else:
                print(line, end='')

process(sys.argv[1])
