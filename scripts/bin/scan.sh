#!/bin/sh

device=$(scanimage -f%d%n|grep -e "canon.*")

scanimage \
  --progress \
  --device "$device" \
  --format=tiff \
  --resolution 300 \
  > $1.tiff

  # --cal=yes \
  # -l 0 -t 0 -x 210 -y 297 \

if [ -f $1.tiff ]; then
  gm convert \
    -monitor \
    -threshold 50% \
    -page A4+0+0 \
    -trim \
    -colors 4 \
    $1.tiff $1.png

  tesseract $1.tiff $1 -l swe hocr

  hocr2pdf -i $1.png -o $1.tmp.pdf < $1.html
  # ps2pdf $1.ps $1.pdf
  rm $1.tiff $1.png $1.html

  if [ -f $1.pdf ]; then
    mv $1.pdf $1.tmp-a.pdf
    gs -q -sPAPERSIZE=a4 -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -sOutputFile=$1.pdf $1.tmp-a.pdf $1.tmp.pdf
    rm $1.tmp.pdf $1.tmp-a.pdf
  else
    mv $1.tmp.pdf $1.pdf
  fi
else
  echo Failed to get file from scanner
fi

