#!/bin/sh

set -eu

trap 'rm -rf regression' EXIT

(
  mkdir regression
  cd regression
  git init
  cp ../test-file*.in .
  git add *
  git config user.email "jd@example.com"
  git config user.name "John Doe"
  git commit -m 'Add test file'

  ../git-subst old new
  ../git-subst '\.Body' .body               # . RE character is escaped
  ../git-subst '\<statuscode\>' statusCode  # Matches whole words only
  ../git-subst '\.method\(\)' '.field'      # .method() becomes .field
  ../git-subst '\.custom\(([^)]*)\)' '.\1'  # .custom(foo) becomes .foo
  ../git-subst -c context 2 two             # Test context
  ../git-subst main Main '*.c.in'           # Test path specification
)

for i in test-file*.in ; do
  if diff $(basename $i .in).ok regression/$i ; then
    echo "Test $i succeded."
  else
    echo "Test $i failed: results (expected, got) differ." 1>&2
    exit 1
  fi
done
