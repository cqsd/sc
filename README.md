> bash "modules" for organizing bash scripts

The `meta` module and a few example utilities are included.
```
$ sc
usage: sc <module> [command]

available modules are:
  meta - setup, search, edit, etc.
  net  - network shortcuts

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
cba with convention ngl. Just alias `sc` to `./base`.

## writing new modules
New modules can be created using the `meta create-module [name]` command. For
example, `sc meta create-module example` will create `./modules/example` with
these contents:

```bash
#!/bin/bash

### module description

_example_subcommand() {  ### subcommand description
    __sc_requires_one_of nc ncat
    if [ $# -lt 1 ]; then
        echo 'usage: subcommand args'
        exit 1
    fi
    __sc_success hello "$@"
}
```

yielding a new module:
```
$ sc example
usage: example [command]

available commands are:
  subcommand - subcommand description
```

See `./modules/` for examples. See `./base` if you're curious how subcommands
are "exported". Spoiler: it's a brittle hack.

FYI: I believe that commands typed into a shell shouldn't contain underscores,
so naming a command with underscores will break autocomplete.

## autocomplete
`fish` completions can be generated with `sc meta generate-fish-completions`.
To install them:
```
$ sc meta update-fish-completions
[+] writing new completions to /Users/example/.config/fish/completions/sc.fish
[+] done
```

Reload the shell. Modules and commands can now be tab-completed:
```
$ sc[TAB]
meta  (setup, search, edit, etc.)  net  (network shortcuts)

$ sc meta[TAB]
create-module                         (create a new module)
edit                             (edit source for a module)
generate-fish-completions  (generate fish completions file)
search                    (search for a command by keyword)
…and 4 more rows
```

`fish` completions need to be regenerated whenever you add/edit modules.

`bash` completions _exist_, but I don't use bash, so they might break.
