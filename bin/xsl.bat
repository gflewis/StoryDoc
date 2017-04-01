set release=RLSE0011659
set base=/Users/gfl01/workspace/StoryDoc
call saxon -xsl:%base%/xsl/data.xsl -s:%base%/data/%release%.stories.xml -o:%base%/data/%release%.xml
call saxon -xsl:%base%/xsl/html.xsl -s:%base%/data/%release%.xml -o:%base%/data/%release%.html
