echo "---> Installing application source"
cp -Rf /tmp/src/*.html ./

DATE=`date "+%Y-%m-%d"`

echo "---> Creating info page" > info.html
echo "Page built on $DATE" >> ./info.html
