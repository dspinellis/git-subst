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
Run the command as: `git subst` _existing-RE-pattern_ _replacement-string_.

## Examples
```sh
git subst old new  # All instances of "old" become "new"
git subst -n old new  # Show the changes but do not perform them
git subst '\.Body' .body  # The "." RE special character is escaped
git subst '\<statuscode\>' statusCode  # Matches whole words only
git subst '\.custom\(([^)]*)\)' '.\1'  # .custom(foo) becomes .foo
```

## Author
Diomidis Spinellis

## See also
[git-grep(1)](https://git-scm.com/docs/git-grep), [sed(1)](https://linux.die.net/man/1/sed), [Unix Tools: Data, Software and Production Engineering](https://www.spinellis.gr/unix?git-subst) free massive open online course (MOOC) hosted by edX.
