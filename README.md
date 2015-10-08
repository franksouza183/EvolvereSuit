# EvolvereSuit

I strongly recommend you clone this repository instead of downloading the zip file, as some users reported missing several symlinks(And zip files can not contain symlinks at all). It will also be convenient when you want to download updates, where only the necessary files will be downloaded/updated.

# Cloning the repository:

On terminal type:

`mkdir -p "~/.evolveresuit" && git clone https://github.com/franksouza183/EvolvereSuit ~/.evolveresuit/`

Then to get updates:

`cd "~/.evolveresuit" && git pull origin master && cd`

# Installing

## Icons

All icon packs are located at *icons* directory of the repository. To install icon pack, you should either symlink or copy directories from *icons* to appropriate locations. List of this locations below.

* KDE 5, GNOME 3, Cinnamon

  For KDE and GNOME it is `${XDG_DATA_DIR}/icons`. `XDG_DATA_DIR` often match `~/.local/share`.

* KDE 4

  KDE 4 users should install icons in `${KDEHOME}/share/icons`. `KDEHOME` location often vary by distribution. But it should be `~/.kde` or `~/.kde4`.

* GNOME 2, MATE

  This Desktop Enviroments use old locations for icons. It is in `~/.icons`. But it is recommended to symlink `~/.icons` to `~/.local/share/icons`, so modern environments can also find these icon packs.

And remember, that directories does not required to be there, and does not automatically created. So if they does not exist, you should create them.

# PPA (Icons)

Many thanks to NoobsLab for this:

```bash
sudo add-apt-repository ppa:noobslab/evolvere -y
sudo apt-get update
sudo apt-get install evolvere-icon-suite -y
```
