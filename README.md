[![Run Regression Test](https://github.com/dspinellis/git-subst/actions/workflows/regression_test.yml/badge.svg)](https://github.com/dspinellis/git-subst/actions/workflows/regression_test.yml)

# git-subst
The git-subst Git subcommand substitutes the specified regular expression
with the specified replacement.  The substitution is only performed in
the Git-tracked files that contain the specified RE located in the
current directory and below.

## Installation
Place the `git-subst` file in a directory of your PATH and give it
execute permission.

## Execution
Run the command as follows.

`git subst` \[`-c` _context-RE_] \[`-n`] _existing-RE-pattern_ _replacement-string_

The command-line options have the following meanings.


`-c` _context_
: Perform the change only on lines matching context regular expression.

`-n`
: Only show what replacements will be performed.

## Examples
```sh
git subst old new          # Change old to new
git subst -c ^// old new   # Change old to new only on lines starting with //
git subst '\.Body' .body               # . RE character is escaped
git subst '\<statuscode\>' statusCode  # Matches whole words only
git subst '\.method\(\)' '.field'      # .method() becomes .field
git subst '\.custom\(([^)]*)\)' '.\1'  # .custom(foo) becomes .foo
```

## Author
Diomidis Spinellis

## See also
[git-grep(1)](https://git-scm.com/docs/git-grep), [sed(1)](https://linux.die.net/man/1/sed), [Unix Tools: Data, Software and Production Engineering](https://www.spinellis.gr/unix?git-subst) free massive open online course (MOOC) hosted by edX.
