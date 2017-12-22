#!/bin/sh
release=RLSE0010018
base=$HOME/workspace/StoryDoc
# xsltproc -o $base/data/$release.xml $base/xsl/getdata.xsl $base/data/$release.stories.xml
echo XSLT step 1
saxon -xsl:$base/xsl/data.xsl -s:$base/data/$release.stories.xml -o:$base/data/$release.xml releasedatafile=$base/data/$release.release.xml
echo XSLT step 2
saxon -xsl:$base/xsl/html2.xsl -s:$base/data/$release.xml -o:$base/data/$release.pre
echo XSLT complete
python3 $base/python/fpp.py $base/data/$release.pre >$base/data/$release.html
