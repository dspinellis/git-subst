#!/bin/sh

set -eu

trap 'rm -rf regression' EXIT

(
  mkdir regression
  cd regression
  git init
  cp ../test-file .
  git add test-file
  git config user.email "jd@example.com"
  git config user.name "John Doe"
  git commit -m 'Add test file'

  ../git-subst old new
  ../git-subst '\.Body' .body               # . RE character is escaped
  ../git-subst '\<statuscode\>' statusCode  # Matches whole words only
  ../git-subst '\.method\(\)' '.field'      # .method() becomes .field
  ../git-subst '\.custom\(([^)]*)\)' '.\1'  # .custom(foo) becomes .foo
  ../git-subst -c context 2 two
)

if diff result-file regression/test-file ; then
  echo 'Test succeded.'
else
  echo 'Test failed: results (expected, got) differ.' 1>&2
  exit 1
fi
