export PATH="$HOME/bin:$PATH"

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# this is for ansible to show running output
export PYTHONUNBUFFERED=1

if command -v keychain >/dev/null 2>&1; then
  keychain
fi

