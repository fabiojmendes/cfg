set -l FILES $(find $HOME -uid 0 | wc -l)

if test $FILES -ne 0
  echo -e '\n'
  echo "## Found $FILES files with root ownership in your home directory"
  echo "## Use sudo chown $USER:$USER -R $HOME to fix it"
  echo -e '\n'
end
