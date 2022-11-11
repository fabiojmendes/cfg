# if not functions -q fisher
#   # Install fisher
#   curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
#   fisher install PatrickF1/fzf.fish
# end
if set -q __cfg_bootstraped
  return
end

echo "Executing bootstrap"
set -U __cfg_bootstraped
