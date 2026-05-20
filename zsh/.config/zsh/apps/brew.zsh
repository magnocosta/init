case "$(uname)" in
  Darwin)
    [ -f /opt/homebrew/bin/brew ] && eval "$(/opt/homebrew/bin/brew shellenv)"
    path=(
      "/usr/local/sbin"
      "/usr/local/opt/libpq/bin"
      $path
    )
    ;;
  Linux)
    ;;
esac
