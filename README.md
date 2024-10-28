# NixOS Home Manager Dotfiles


This configuration provides a minimal desktop environment using X11 display server with standalone i3 window manager, complemented by Fish shell as the default terminal environment and neovim as the configured editor.


## Prerequisites

- Nix with flakes enabled
- home-manager
- sops and age need to be installed via nix channel first

### Setup and Secrets Management

1. Set up age symmetric key inside correct folder:
```bash
# Create directory for age key
mkdir -p ~/.config/sops/age
# generate new key at ~/.config/sops/age/keys.txt
nix shell nixpkgs#age -c age-keygen -o ~/.config/sops/age/keys.txt
# get a public key of ~/.config/sops/age/keys.txt
nix shell nixpkgs#age -c age-keygen -y ~/.config/sops/age/keys.txt
```

2. Create `.sops.yaml` in your repository root:
```yaml
keys:
  - &key age1... # Replace with your public key from previous step
creation_rules:
  - path_regex: secrets/secrets.yaml$
    key_groups:
    - age:
      - *key
```

3. Encrypt your secrets with sops:
```bash
sops secrets/secrets.yaml
```

4. Create your secrets file (`secrets/secrets.yaml`):
```yaml
# SSH Configurations
ssh_github_email: your.email@example.com
ssh_github_identity: ~/.ssh/id_ed25519_github
# Git Configuration
git_username: yourname
git_email: your.email@example.com
```

5. Normal configuration can be done in home.nix. Inside hosts/legion/private-config.nix I have my private setup for ssh sensitive data. Here you can configure private-config data. Implementation is not so nice right now because I encountered many problems with sops in standalone Home-Manager. 

6. Add wallpaper.jpg to this path: general/images/wallpaper/wallpaper.jpg

7. Apply the configuration, you can also change host name inside flake.nix:
```bash
home-manager switch --flake .#legion
```


