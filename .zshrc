parse_git_branch() {
    git rev-parse --is-inside-work-tree &>/dev/null
    if [ $? -eq 0 ]; then
        git branch 2>/dev/null | sed -n -e 's/^\* \(.*\)/[\1]/p'
    fi
}
COLOR_DEF='%f'
COLOR_USR='%F{208}'    # Orange
COLOR_DATE='%F{245}'   # Gray
COLOR_DIR='%F{81}'     # Cyan
COLOR_GIT='%F{220}'    # Yellow-Orange
# About the prefixed `$`: https://tldp.org/LDP/Bash-Beginners-Guide/html/sect_03_03.html#:~:text=Words%20in%20the%20form%20%22%24',by%20the%20ANSI%2DC%20standard.
NEWLINE=$'\n'
# Set zsh option for prompt substitution
setopt PROMPT_SUBST
export PROMPT='${COLOR_USR}rh@%M ${COLOR_GIT}$(parse_git_branch)${COLOR_DEF}${NEWLINE}┌─[${COLOR_DATE}%D{%d/%m/%y-%H:%M:%S}${COLOR_DEF}] ${COLOR_DIR}%~${COLOR_DEF}${NEWLINE}└─% '
# export PROMPT='${COLOR_USR}rh@%M › ${COLOR_DATE}[%D{%f/%m/%y}-%D{%L:%M:%S}] ${COLOR_DIR}%d ${COLOR_GIT}$(parse_git_branch)${COLOR_DEF}${NEWLINE}→ '
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[[ -s "/Users/marekziska/.gvm/scripts/gvm" ]] && source "/Users/marekziska/.gvm/scripts/gvm"

source ~/.zprofile
