#!/bin/bash -e
#
# (C) 2024, Roberto A. Foglietta <roberto.foglietta@gmail.com> - 3-clause BSD
#

opt="--enable-local-file-access"

for i in "$@"; do
    case $1 in
    "-g") opt="-g $opt"
        shift
        ;;
    "-w") echo "@import url('pdfwarm.css');" > html/custom.css
        shift
        ;;
    "-c") echo "@import url('pdfcool.css');" > html/custom.css
        shift
        ;;
       *) break
        ;;
    esac
    shift
done

echo
for f in ${@:-html/*.html}; do
    test -r "$f" || continnue
    echo "converting in PDF file: $f"
    wkhtmltopdf -ql $opt $f ${f%.html}.pdf
    echo
done
mv html/*.pdf pdf
