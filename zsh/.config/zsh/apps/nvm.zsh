case "$(uname)" in
  Darwin)
    export NVM_HOMEBREW=$(brew --prefix nvm)
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_HOMEBREW/nvm.sh" ] && \. "$NVM_HOMEBREW/nvm.sh"  # This loads nvm
    [ -s "$NVM_HOMEBREW/etc/bash_completion.d/nvm" ] && \. "$NVM_HOMEBREW/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
    ;;
  Linux)
    ;;
esac
