#!/bin/bash

VERBOSE=false

### Increments the part of the string
## $1: version itself
## $2: number of part: 0 – major, 1 – minor, 2 – patch
increment_version() {
  local delimiter=.
  local array=($(echo "$1" | tr $delimiter '\n'))
  array[$2]=$((array[$2]+1))
  if [ $2 -lt 2 ]; then array[2]=0; fi
  if [ $2 -lt 1 ]; then array[1]=0; fi
  echo $(local IFS=$delimiter ; echo "${array[*]}")
}

TYPE=1
case "$1" in
  "major")
    TYPE=0
    ;;
  "minor")
    TYPE=1
    ;;
  "patch")
    TYPE=2
    ;;

  *)
    echo "Incorrect increment type input: $1 - should be major, minor or patch"
    exit 1;
    ;;
esac

[ "$VERBOSE" = true ] && echo "Increment Type: $TYPE"

VERSION_MATCH_STRING='version='

if [[ "$OSTYPE" == "darwin"* ]]; then
  CURRENT=$(grep -o '\d.\d.\d' ./source/pdxinfo)
else
  CURRENT=$(grep -Po '\d.\d.\d' ./source/pdxinfo)
fi
# CURRENT=$(awk -F \" '$VERSION_MATCH_STRING ".+"/ { print $1; exit; }' ./source/pdxinfo)

[ "$VERBOSE" = true ] && echo "Current Version: $CURRENT"

NEW_VERSION=$(increment_version $CURRENT $TYPE)
[ "$VERBOSE" = true ] && echo "New Version: $NEW_VERSION"


if [[ "$OSTYPE" == "darwin"* ]]; then
  sed -i '' -e "s/\($VERSION_MATCH_STRING\).*/\1$NEW_VERSION/" ./source/pdxinfo
else
  sed -i "s/\($VERSION_MATCH_STRING\).*/\1$NEW_VERSION/" ./source/pdxinfo
fi

echo $NEW_VERSION
