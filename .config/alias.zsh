# Aliases configuration
# Add your aliases here 

case "${OSTYPE}" in
    linux*)
        alias pbcopy='xclip -selection clipboard'
        alias pbpaste='xclip -selection clipboard -o'
        ;;
esac 


alias ccw='cc -Wall -Wextra -Werror'
alias clone='git clone --recursive $(pbpaste)'
alias ga='git add'
alias gc='git commit -m'
alias gp='git push'
alias gsw='git switch'

