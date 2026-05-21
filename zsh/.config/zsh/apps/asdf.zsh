if command -v asdf &> /dev/null; then
  path=(
    "$HOME/.asdf/shims"
    $path
  )
fi
