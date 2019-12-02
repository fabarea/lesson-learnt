---
title: Makefile - scaffolding
---

Makefile are great in the sense they simplify complex commands in a straightforward manner. Although they are simple to write and handy to use, the syntax a bit "old-school" and quite error prone. This is probably due to the fact, Makefiles come from a long past where things were not as polish as today.... Nevertheless, I use them all the time.

## Example of Makefile for PHP script

Source of inspiration:

https://gist.github.com/B-Galati/ff6ad09aab746736bcf497f0fe67bca9

What is the coding style guide of a Makefile?
---------------------------------------------

Makefile must be with indented with **tabs**. Fetch the `.editorconfig` file.

```sh
curl https://raw.githubusercontent.com/fabarea/dotfiles-minimal/master/.editorconfig > .editorconfig
```

What could be a Makefile scaffold?
----------------------------------

```makefile
CLI_IMAGE ?= "fab1en/athenapdf"

P="\\033[34m[+]\\033[0m"

help:
	@echo
	@echo "  \033[34mpdf\033[0m – generate the PDF"
	@echo

pdf:
	@echo "  $(P) pdf"
	@docker run --rm --init -v $PWD:/home/marp/app/ $(CLI_IMAGE)

.PHONY: help pdf
```

