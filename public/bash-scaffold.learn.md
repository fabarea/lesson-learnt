---
date: 2019-03-21T10:39:12.000Z
title: Bash - script scaffold
---

How would you scaffold your bash script?
----------------------------------------

I found inspiring the way the `rustup` script is architectured... To be personalized of course.

Source:

```bash
curl https://static.rust-lang.org/rustup.sh | less
```

Extract of the script:

```bash

#!/bin/bash
set -u # Undefined variables are errors

main() {
assert_cmds
set_globals
handle_command_line_args "$@"
}

# Help

print_help() {
echo '
Usage: rustup.sh [--verbose]

Options:

--channel=(stable|beta|nightly)   Install from channel (default stable)
--date=<YYYY-MM-DD>               Install from archives
--revision=<version-number>       Install a specific release
--spec=<toolchain-spec>           Install from toolchain spec
--prefix=<path>                   Install to a specific location (default /usr/local)
--uninstall                       Uninstall instead of install
--disable-ldconfig                Do not run ldconfig on Linux
--disable-sudo                    Do not run installer under sudo
--save                            Save downloads for future reuse
--yes, -y                         Disable the interactive mode
'
}

# Standard utilities

arguments: BRANCH, DIR (optional)
=================================

say() {
    echo "rustup: $1"
}

say_err() {
    say "$1" >&2
}

verbose_say() {
    if [ "$flag_verbose" = true ]; then
    say "$1"
    fi
}

err() {
    say "$1" >&2
    exit 1
}

need_cmd() {
    if ! command -v "$1" > /dev/null 2>&1
    then err "need $1"
    fi
}

need_ok() {
    if [ $? != 0 ]; then err "$1"; fi
}

assert_nz() {
    if [ -z "$1" ]; then err "assert_nz $2"; fi
}

# Run a command that should never fail. If the command fails execution
# will immediately terminate with an error showing the failing
# command.
ensure() {
"$@"
    need_ok "command failed: $*"
}

# This is just for indicating that commands' results are being
# intentionally ignored. Usually, because it's being executed
# as part of error handling.
ignore() {
    run "$@"
}

# Runs a command and prints it to stderr if it fails.
run() {
    "$@"
    local _retval=$?
    if [ $_retval != 0 ]; then
        say_err "command failed: $*"
    fi
    return $_retval
}

main "$@"
    
```