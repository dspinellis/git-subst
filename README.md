# git-subst
The git-subst Git subcommand substitutes the specified regular expression
with the specified replacement.  The substitution is only performed in
the Git-tracked files that contain the specified RE located in the
current directory and below.

## Installation
Place the `git-subst` file in a directory of your PATH and give it
execute permission

## Execution
Run the command as: `git subst` _existing-RE-pattern_ _replacement-string_

## Examples
```sh
git subst old new
git subst -n old new  # Show the changes but do not perform them
git subst '\.Body' .body  # . RE character is escaped
git subst '\<statuscode\>' statusCode  # Matches whole words only
git subst '\.custom\(([^)]*)\)' '.\1'  # .custom(foo) becomes .foo
```

## Author
Diomidis Spinellis

## See also
git-grep(1), sed(1), https://www.spinellis.gr/unix
