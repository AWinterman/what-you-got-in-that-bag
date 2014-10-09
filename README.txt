bag [opionts] git-url

Example:

  bag -e=md -o=./build -s=./style.css -f html

Description:

Clone and pandoc a git repo. The rendered output will include table of
contents.

Relies heavily on pandoc under the hood:
http://johnmacfarlane.net/pandoc/README.html

    -e EXTENSION

        What extension to render into html. Defaults to .md. May be specified
        multiple times to gather multiple extensions. 

    -o DIRECTORY

        the output directory into which to put all the rendered markup.
        Defaults to ./build

    -s STYLESHEET

        passed directly to pandocs "-c" arg. A css stylesheet for your
        repository.  Defaults to ./style.css

    -f FORMAT

        What output format to render files into. Defaults to html. Must be a
        valid pandoc FORMAT. See http://johnmacfarlane.net/pandoc/README.html

    -b BRANCH
        
        BRANCH specifies

    -c

        If present, `scp` is used to transfer files. Better set it up so that
        it won't prompt. If present, -b is ignored.
