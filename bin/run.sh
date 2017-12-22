release=RLSE0010018
cd $HOME/workspace/StoryDoc
echo Python get rm_release
python3 python/getxml.py -t rm_release -q number=$release -o data/$release.release.xml
echo Python get rm_story
python3 python/getxml.py -t rm_story -q active=true^release.number=$release -o data/$release.stories.xml
