#!/usr/bin/env bash

usage() {
cat <<EOF
Usage:
Convert color value between colorspaces
Requires imagemagick's convert

Examples
  $(basename $0) "#1D1C27" sRGB.icc calibrated-U2412M.icc
  $(basename $0) "rgb(0,255,255)" sRGB.icc calibrated-U2412M.icc
EOF
}

if [[ $# -le 2 || $# == "--help" || $# == "-h" ]]
then
  usage
  exit 1
fi

convert xc:"$1" -depth 8 -profile "$2" -write txt: -profile "$3" txt: | grep -o '#[0-9A-F][^ ]*' | tail -n1
