bag [opionts] git-url

Example:

  bag -e=md  -o=./build -s=./style.css -f html

Description:

Clone and pandoc a git repo. The rendered output will include table of
contents.

  -e EXTENSION

    What extension to render into html. Defaults to .md

  -o DIRECTORY

    the output directory into which to put all the rendered markup. Defaults to
    ./build

  -s STYLESHEET

    passed directly to pandocs "-c" arg. A css stylesheet for your repository.
    Defaults to ./style.css

  -f FORMAT

    What output format to render files into. Defaults to html
