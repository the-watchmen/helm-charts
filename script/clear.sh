#!/bin/bash -x
set -o nounset
set -o errexit

echo "begin"

echo "clearing releases"

for rel in $(hub release) ; do
  echo "found release ${rel}"
  hub release delete ${rel}
  git push --delete origin ${rel}
  git tag -d ${rel} || true
done

echo "end"