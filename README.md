> bash "modules" for organizing bash scripts

```
$ sc
usage: sc <module> [command]

available modules are:
  meta - setup, search, edit, etc.

$ sc meta
usage: meta [command]

available commands are:
  search                    - search for a command by keyword
  setup                     - install/build deps (unimplemented don't use)
  edit                      - edit source for a module
  show                      - show source for a command
  create-module             - create a new module
  test-loggers              - no help found
  generate-fish-completions - generate fish completions file
  update-fish-completions   - update fish completions file
```

## installation
cba with convention. just alias `sc` to `./base`.

## writing new modules
to create an `example` module, run `meta create-module example`. this creates
a `./modules/example` file

```bash
#!/bin/bash

### module description

_example_command() {  ### command description
    __sc_requires_one_of nc ncat
    if [ $# -lt 1 ]; then
        echo 'usage: command args'
        exit 1
    fi
    __sc_success hello "$@"
}
```

this exposes an `example` module with a `command` command
```
$ sc
usage: sc <module> [command]

available modules are:
  example - module description
  meta    - setup, search, edit, etc.

$ sc example
usage: example [command]

available commands are:
  command - command description
```

## autocomplete
`fish` completions can be generated with `sc meta generate-fish-completions`.
cuz u potentially need to regenerate them fairly often, there's a convenience
script to update them in the default location:
```
$ sc meta update-fish-completions
[+] writing new completions to /Users/example/.config/fish/completions/sc.fish
[+] done
```

they'll be available after you reload the shell:
```
$ sc[TAB]
meta  (setup, search, edit, etc.)  example  (module description)

$ sc meta[TAB]
create-module                         (create a new module)
edit                             (edit source for a module)
generate-fish-completions  (generate fish completions file)
search                    (search for a command by keyword)
…and 4 more rows
```

`fish` completions need to be regenerated whenever you add/edit modules.

## todo
`zsh` completions are planned. otherwise just read `./base`. it's obvious that
_something_ needs to be done.

### why did you do this with this brittle \_modulename\_commandname stuff instead of using dir structure to define modules and one file for each command. that would have been cleaner, and you wouldn't have to do all this stupid parsing and grepping through bash that could easily break if someone just wrote their functions a little differently than you. overall it could have been simpler and more robust if you j
shut up
