TEMP=`mktemp -t what-you-got -d`
CURDIR=`pwd`
TITLE=$(basename $TARGET)

if [ -z "$TOCTEMPLATE" ]
then
        TOCTEMPLATE="./template.html"
fi

if [ -z "$OUT" ]
then
        OUT="./build"
fi

if [ -z "$STYLE" ]
then
        STYLE='style.css'
fi

mkdir -p $OUT
cp $STYLE $OUT

git clone $TARGET $TEMP 

cd $TEMP 
git checkout $BRANCH
cd $CURDIR

MARKDOWNS=`find $TEMP -name "*.md"`
NAMES=$(echo $MARKDOWNS | sed "s|$TEMP||g")

RENDERD=""

for name in $NAMES;
do
        html_name=${name%".md"}.html
        mkdir -p "$OUT"`dirname $name`
        pandoc -s -S -c /$STYLE -t html $TEMP$name -o $OUT$html_name
        RENDERED+="<li><a href=\".$html_name\">${name##.md}</a></li>"
done


TITLE=$TITLE NAMES="<ul>"$RENDERED"</ul>" ./bin/j2 --format=env $TOCTEMPLATE > $OUT/index.html

cd build
python -m SimpleHTTPServer 8001
cd $CURDIR
