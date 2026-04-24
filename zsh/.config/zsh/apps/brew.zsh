case "$(uname)" in
  Darwin)
    path=(
      "/usr/local/sbin"
      "/usr/local/opt/libpq/bin"
      $path
    )
    ;;
  Linux)
    ;;
esac
