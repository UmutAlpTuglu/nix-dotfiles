# This is executed when a bash login shell is spawned
[[ -f ~/.bashrc ]] && . ~/.bashrc

if [ -e /home/$USER/.nix-profile/etc/profile.d/nix.sh ]; then . /home/$USER/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

# Drops instantly into a fish login shell
exec fish --login
