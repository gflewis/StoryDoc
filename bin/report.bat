set release=%1
echo processing %release%
set base=\Users\gfl01\workspace\StoryDoc
python %base%\python\getxml.py -t rm_release -q number=%release% -o %base%\data\%release%.release.xml
python %base%\python\getxml.py -t rm_story -q release.number=%release% -o %base%\data\%release%.stories.xml
call saxon -xsl:%base%\xsl\data.xsl -s:%base%\data\%release%.stories.xml -o:%base%\data\%release%.xml
call saxon -xsl:%base%\xsl\html.xsl -s:%base%\data\%release%.xml -o:%base%\data\%release%.html
"C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" --new-window %base%\data\%release%.html
