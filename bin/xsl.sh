#!/bin/sh
release=RLSE0011659
base=/Users/giles/workspace/StoryDoc
# xsltproc -o $base/data/$release.xml $base/xsl/getdata.xsl $base/data/$release.stories.xml
echo XSLT step 1
saxon -xsl:$base/xsl/data.xsl -s:$base/data/$release.stories.xml -o:$base/data/$release.xml
echo XSLT step 2
saxon -xsl:$base/xsl/html.xsl -s:$base/data/$release.xml -o:$base/data/$release.html
echo XSLT complete

