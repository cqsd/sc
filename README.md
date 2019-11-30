## utilities
 - [make shit](https://swcarpentry.github.io/make-novice/reference.html)

## TODO
instead of `_module_command() { ... }` you _could_ source whichever module gets
passed, though namespacing might be hard. helptext would just be in a comment at
the top of the file I guess, maybe with a special identifier like

```
#:show-pass       - show item in local keychain (OS X only)
#:xargs-edit (xe) - cut -d: -f1 | sort | uniq | xargs \${EDITOR:-vi}
#:wayback         - wayback machine search (opens a browser) (hermit!!)
#:normie-check    - find people who put their employer in their twitter bio
#:test-loggers    - test output of logging functions
```

or you could even put the shit as a docstring... ah shit, we're gonna write a
PL parser in bash eventually, aren't we
