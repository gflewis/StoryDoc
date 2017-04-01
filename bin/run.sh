release=RLSE0011659
cd /Users/giles/workspace/StoryDoc
python3 python/getxml.py -t rm_release -q number=$release -o data/$release.release.xml
python3 python/getxml.py -t rm_story -q release.number=$release -o data/$release.stories.xml
