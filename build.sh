#!/bin/sh
set -xe
TZ="America/Chicago"
emacs -Q --script ./build-site.el
# cp content/style.xsl public/ && echo "Copied style.xsl!"
# cp content/logo.svg public/ && echo "Copied logo!"
# cp content/favicon.png public/ && echo "Copied Favicon!"
rsync -avzh ./content/static public

find public -depth -type f -name "*.html" \
     -exec sh -c 'mv "$1" "${1%.html}.xhtml"' _ {} \;

