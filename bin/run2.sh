release=RLSE0010018
base=$HOME/workspace/StoryDoc
cd $base
echo Python get rm_release
python3 python/getxml.py -t rm_release -q number=$release -o data/$release.release.xml
if [ $? != 0 ]
then
  exit
fi
echo Python get rm_story
python3 python/getxml.py -t rm_story -q release.number=$release -o data/$release.story.xml
echo XSLT step 1
saxon -xsl:$base/xsl/data2.xsl -s:$base/xsl/report.xml -o:$base/data/$release.xml
echo XSLT step 2
saxon -xsl:$base/xsl/html2.xsl -s:$base/data/$release.xml -o:$base/data/$release.pre
echo XSLT complete
python3 $base/python/fpp.py $base/data/$release.pre >$base/data/$release.html
echo created $release.html
