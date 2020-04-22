---
title: Bash - my stubborn donkey
tags:
  - bash
  - shell
---

My stubborn donkey
==========================

Bash is like a donkey - although I like these animals very much - very **stubborn** but at the same time **very useful**. Writing bash scripts is a quite a frustrating experience if I am honest. Bash makes things hard and inflexible. It looks however as a necessary pain since bash is installed and is the default shell on almost every distributions. This is the garantee that it will work. I am often looking for alternatives (such as [OSH shell](https://www.oilshell.org/blog/2018/01/28.html)) or hoping bash would improve to offer a better user experience. We have [bash 5](https://itsfoss.com/bash-5-release/) recently released but don't see any roadmap although the development looks active. Let see how it will evolve... 

Anyway here are a few notes and resources I gathered to make my life easier. Also, worth to be mentioned, [the jetbrains bash plugin](https://plugins.jetbrains.com/plugin/4230-bashsupport/) is very useful associated with the bash linter. It provides many tips and tricks that an occasional "basher" would not know.

Next generation UNIX shell.
---------------------------

See the man page.

<https://github.com/ilyash/ngs/>

Fish
----

fish is a smart and user-friendly command line shell for OS X, Linux, and the
rest of the family.

<https://fishshell.com/>

Alternatives
------------

*   Next Generation Shell (NGS) - <https://github.com/ilyash/ngs>

*   Oil shell - <http://www.oilshell.org/>

*   Web-Terminal is a terminal server that provides remote CLI via standard web
    browser and HTTP protocol. - <https://github.com/rabchev/web-terminal>

How can I loop in bash?
-----------------------------------------

There are various way to look. Here would be one way.

```bash
#!/bin/bash
SOURCE_PATH="$HOME/pCloudDrive/Fabien/Notes"

files=(
  'blockchain-fusion.learn.md'
  'blockchain-gridcoin.learn.md'
  'blockchain-iot.learn.md'
  'blockchain-talos.learn.md'
)

# Set counter variable
counter=0

# shellcheck disable=SC2068
for file in ${files[@]}; do

  sourceFileNameAndPath="$SOURCE_PATH/$file"

  if [ -f "$sourceFileNameAndPath" ]; then
    # ... do something here
    
    # shellcheck disable=SC2004
    counter=$(( $counter + 1 ))
  fi
done

echo "Done! Processed $counter files"
```


How can I loop around files?
---------------------

```bash
# shellcheck disable=SC2231
for file in /path/*.learn.md; do
  # ... do something
  echo "$file"
done
```

The same could be accomplished with:


```bash
#!/bin/bash

find . -name "*.md" -depth 1 |
while read filename
do
        echo "$filename"
done
```


How do I increment a counter in a loop?
---------------------------------------

```bash
counter=0
# shellcheck disable=SC2004
counter=$(($counter + 1))
```

How do I write function with a returned values?
-----------------------------------------------

Simple function that will return a formatted current date:

```bash
function getCurrentDate() {
  local currentDate

  currentDate=$(date '+%m-%d-%Y @ %H:%M')
  echo "$currentDate"
}

result=$(getCurrentDate)
echo $result
```

Same as above but a bit more straightforward:

```bash
function getCurrentDate() {
  date '+%m-%d-%Y @ %H:%M'
}

result=$(getCurrentDate)
echo $result
```

A little collection of cool unix terminal/console/curses tools
--------------------------------------------------------------

<http://kkovacs.eu/cool-but-obscure-unix-tools/>

Quelques bonnes pratiques dans l'écriture de scripts en Bash
------------------------------------------------------------

<http://ineumann.developpez.com/tutoriels/linux/bash-bonnes-pratiques/\#LIII-C>

What are the good practices?
---------------------------------------

Define the [shebang](https://en.wikipedia.org/wiki/Shebang_(Unix))

```sh
#!/usr/bin/env bash
```

Right below on the top:

```bash
set -e	# exit the script if any statement returns non-true return value 
set -u	# abort on unbound variable
set -o pipefail  # don't hide errors within pipes

# Exit the script on error and unbound variable
set -eu

# Exit the script on error, unbound variable and erreors in pipes
set -euo pipefail
```

Return a status code

```bash
exit $?
```

Example how to check if script runs longer than 2 hours
----------------------------------------

        root\@srv123:/home/mstucki\# cat /etc/cron.hourly/kill-old-sphinx-tasks
        \#!/bin/bash
    
        if [ `id -u` != 0 ]; then echo "You are not root." exit 1 fi
    
        USERNAME="mbless" COMMAND="sphinx-build" AGE=180
    
        find /proc -maxdepth 1 -user $$USERNAME -type d -mmin +$$AGE -exec basename {} ;
        \| xargs -r ps \| grep \$COMMAND \| awk '{print \$1}' \| while read PID; do echo
        "Killing task: \$PID" echo
        "======================================================" ps u \$PID echo
        "======================================================" echo
    
        kill $PID
    
    done

Bash Keyboard Shortcuts
-----------------------

Yes, like on a piano! :musical_keyboard:

<http://ss64.com/bash/syntax-keyboard.html>

Curly bracket
-------------

<http://www.linuxjournal.com/content/bash-brace-expansion>

    {aa,bb,cc,dd}  => aa bb cc dd
    {0..12}        => 0 1 2 3 4 5 6 7 8 9 10 11 12
    {3..-2}        => 3 2 1 0 -1 -2
    {a..g}         => a b c d e f g
    {g..a}         => g f e d c b a

Cheat sheet
-----------

<http://www.pixelbeat.org/cmdline.html>

https://bertvv.github.io/cheat-sheets/Bash.html

Revue des techniques de programmation en shell
------

Advanced concept there

https://linuxfr.org/news/revue-des-techniques-de-programmation-en-shell (french)

Pure bash bible
---------------

It looks some guy have smoke quite some strong stuff!

<https://github.com/dylanaraps/pure-bash-bible>

Hyperpolyglot
-------------

Unix Shells: Bash, Fish, Ksh, Tcsh, Zsh. Syntax comparison

<http://hyperpolyglot.org/unix-shells>

