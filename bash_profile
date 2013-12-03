# bash specific login shell only

# the existence of this file will prevent bash from running the cross shell
# .profile script, so source that as well
if [ -f ~/.profile ]; then
  source ~/.profile
fi
