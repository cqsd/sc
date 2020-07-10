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

## writing new modules/commands
see `./modules/meta` for example layout. use `meta create-command` for
convenience.

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
`zsh` completions are planned
