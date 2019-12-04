#!/usr/bin/env bash
# this is obviously extremely brittle and dependent on me/whoever
# writing all modules exactly the same way

# I have no clue how bash completions are supposed to work.
# This one's pwd-dependent; if I source this in .bash(rc|_profile),
# it won't be able to find modules/
# hardcoding this is actually the best solution i can think of atm
SRCDIR=~/bin/src/shortcuts

__sc_completions() {
    # I have no fucking idea how the indexing/array length things work
    if [ "${#COMP_WORDS[@]}" = "2" ]; then
        COMPREPLY=($(compgen -W "$(ls ${SRCDIR}/modules)" "${COMP_WORDS[1]}"))
    elif [ "${#COMP_WORDS[@]}" = "3" ]; then
        MODULE="${COMP_WORDS[1]}"
        # remove the long and short help functions
        # trim the module prefix
        # remove the bash function declaration syntax stuff
        SUGGESTIONS=($(grep -e "^_${MODULE}" ${SRCDIR}/modules/${MODULE} \
            | grep -ive short_help -e "^_${MODULE}()" \
            | sed -e "s/^_${MODULE}_//g" \
                  -e "s/() *{//g"))
        COMPREPLY=($(compgen -W "${SUGGESTIONS[*]}" "${COMP_WORDS[2]}"))
    fi
}

complete -F __sc_completions sc
