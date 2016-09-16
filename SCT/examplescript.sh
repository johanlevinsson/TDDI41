#!/bin/bash 

function verbose() {
  test "$VERBOSE" && echo "$@" >&2
}

function usage() {
  echo "Usage: $0 [-v] PATTERN FILE..." >&2
  exit 1
}

if [ "$1" = '-v' ] ; then
  VERBOSE=1
  shift
fi

PATTERN="$1" ; shift
test "$PATTERN" -a "$1" || usage

TMPDIR=`mktemp -d` || exit 1
for file in "$@" ; do
  if grep "$PATTERN" "$file" >& /dev/null ; then
    verbose "Copying $file"
    cp "$file" "$TMPDIR"
  fi
done
(cd "$TMPDIR" ; tar cf - .)
rm -rf "$TMPDIR"


