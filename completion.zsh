#compdef sc
_sc() {
    typeset -A opt_args
    local state
    _arguments -C \
        "1:module:->needs_module" \
        "2:command:->needs_command"

    _sc_modules=(${(f)"$(sc meta zsh-completions)"})
    case $state in
        needs_module)
            _describe 'module' _sc_modules
        ;;
        needs_command)
            _sc_module_commands=(${(f)"$(sc meta zsh-completions ${words[2]})"})
            _describe 'command' _sc_module_commands
        ;;
    esac
}

_sc "$@"
