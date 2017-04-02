set release=%1
set olddir=%cd%
set wbase=\Users\gfl01\workspace\StoryDoc
set ubase=/Users/gfl01/workspace/StoryDoc
set pydir=%ubase%/python
set xsldir=%ubase%/xsl
set releasedatafile=%ubase%/data/%release%.release.xml
set storydatafile=%ubase%/data/%release%.stories.xml
cd %wbase%\data

python %pydir%/getxml.py -t rm_release -q number=%release% -o %releasedatafile%
python %pydir%/getxml.py -t rm_story -q release.number=%release% -o %storydatafile%

call saxon -xsl:%xsldir%/data.xsl -s:%release%.stories.xml -o:%release%.xml release=%release% releasedatafile=%releasedatafile%
call saxon -xsl:%xsldir%/html.xsl -s:%release%.xml -o:%release%.html

"C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" --new-window %wbase%\data\%release%.html

cd %olddir%