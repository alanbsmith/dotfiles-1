# various paths
set --export PATH $HOME/bin /usr/local/bin /usr/local/sbin $PATH

if test -d $HOME/code/dotfiles/bin
  set --export PATH $HOME/code/dotfiles/bin $PATH
end

# for golang
if test -d "$HOME/golang"
  set --export GOPATH "$HOME/golang"
  set --export PATH   $PATH "$GOPATH/bin"
  set --export PKG_CONFIG_PATH  "/usr/lib/pkgconfig"
end

# Rails cucumber integration looks for this env var to decide how to display output
set --export CUCUMBER_FORMAT pretty

# Custom kill and foreground commands since I work with a lot of background jobs
for i in (seq 30)
  eval "function $i
          fg %$i
        end"
end

# Tell homebrew not to auto update if I've already done it this week
set --export HOMEBREW_AUTO_UPDATE_SECS (echo '60 * 60 * 24 * 7' | bc)

# Load ruby. Interface is less helpful than rbenv
# but Brixen says it works with rbx in ways that rbenv's assumptions won't let it
if test -e /usr/local/share/chruby/chruby.fish
  source   /usr/local/share/chruby/chruby.fish
end

# Don't print a greeting when I start the shell
set --erase fish_greeting

# For configs that I don't want in my public git (ie work stuff and stuff that changes across computers)
if test -e ~/.config/fish/private_config.fish
  source   ~/.config/fish/private_config.fish
end

# Have `tree` colour directories yellowish
# this shit is so badly documented and inconsistent
set --export LS_COLORS 'di=33'


# Provide metadata to iTerm2 so that it can provide useful features
# Documentation: http://iterm2.com/documentation-shell-integration.html
# Original src:  https://iterm2.com/misc/fish_startup.in
#
# Commented out b/c it seemed to cause fish to get really fkn slow with the last update (fish v2.5.0)
#
# source ~/.config/fish/iterm2_shell_integration.fish
