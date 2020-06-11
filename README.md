# Dotfiles

This is my 2nd take at a dotfiles repo. My first attempt followed [this Atlassian dotfiles tutorial](https://www.atlassian.com/git/tutorials/dotfiles), however I found it to be rather messy. This attempt is based off of [zellwk's dotfiles repo](https://github.com/zellwk/dotfiles). I plan on doing a blog post about why I switched and how I setup my whole dev environment, and if I remember I'll link it here.

## Usage
The TL;DR is

```
git clone git@github.com:aidanstansfield/dotfiles.git
cd dotfiles
bash ./setup.sh
```

## Explaining what it does
Feel free to peruse the scripts if that's what you like, but I shall summarize what the scripts do.

1. Checks to see whether the environment is Linux or macOS and runs the appropriate setup script. (I use WSL2 on Windows)
2. Each script:
   1. Installs some necessary packages (either with APT, Homebrew, or plain old git+bash magic)
   2. Installs ZSH and zplug
   3. Backs up any existing dotfiles into ~/.dotfiles.bak/
   4. Places symbolic links to the dotfiles in this repo
   5. Done!

After the script completes, you may need to do the following:

* Restart your shell, and say `y` to installing the ZSH plugins with zplug
* Open vim/nvim and run `:PlugInstall`

## Work in progress
It should be noted that this repo is still a work in progress - you may notice there are still some of [zellwk's dotfiles/scripts](https://github.com/zellwk/dotfiles) in this repository that aren't being used by [setup.sh](setup.sh) (i.e. some of [mac](mac/) and all of [env](env/)). This is because they looked interesting but I have not had the time to comb through them yet.
