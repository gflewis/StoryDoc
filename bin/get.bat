set release=%1
set base=/Users/gfl01/workspace/StoryDoc
python %base%/python/getxml.py -t rm_release -q number=%release% -o %base%/data/%release%.release.xml
python %base%/python/getxml.py -t rm_story -q release.number=%release% -o %base%/data/%release%.stories.xml
