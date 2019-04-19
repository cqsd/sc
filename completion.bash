#!/usr/bin/env bash
__sc_completions() {
    # I have no fucking idea how the indexing/array length things work
    if [ "${#COMP_WORDS[@]}" = "2" ]; then
        COMPREPLY=($(compgen -W "$(ls modules)" "${COMP_WORDS[1]}"))
    elif [ "${#COMP_WORDS[@]}" = "3" ]; then
        MODULE="${COMP_WORDS[1]}"
        # remove the long and short help functions
        # trim the module prefix
        # remove the bash function declaration syntax stuff
        SUGGESTIONS=($(egrep "^_${MODULE}" modules/${MODULE} \
            | grep -ive short_help -e "^_${MODULE}()" \
            | sed -e "s/^_${MODULE}_//g" \
                  -e "s/() *{//g"))
        COMPREPLY=($(compgen -W "${SUGGESTIONS[*]}" "${COMP_WORDS[2]}"))
    fi
}

complete -F __sc_completions sc
