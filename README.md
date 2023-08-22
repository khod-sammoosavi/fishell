# FISH - Friendly Interactive SHell
A library for Fish Shell that provides you with basic functionality.
## Structure
```fish
/home/sammoosavi/.config/fish
├── colorschemes
│   ├── base.fish
│   └── default.fish
├── completions
│   └── fisher.fish
├── config.fish
├── fish_variables
└── functions
    └── fisher.fish
```
and user costom configurations in : `~/.config/fish/fishrc.fish`
```
/home/sammoosavi/.fish
├── fish_plugins
│   ├── completions
│   ├── conf.d
│   ├── functions
│   └── themes
├── fish_plugins.txt
└── fishrc.fish

```
## Create new colorscheme
Colorschemes located in the `colorschemes` directory.
To write a new theme, you need to create a file named "theme" in this directory and apply the new theme.

**For example :**
```fish
set colorscheme "default"
```
## Installation
```bash
git clone https://gitlab.com/sammoosavi/fish.git ~/.config/fish
```
## License
GPL-V3
