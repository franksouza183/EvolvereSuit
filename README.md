# EvolvereSuit

I strongly recommend you clone this repository instead of downloading the zip file, as some users reported missing several symlinks. It will also be convenient when you want to download updates, where only the necessary files will be downloaded/updated.

# Cloning the repository:

On terminal type:

`if [[ ! -d ~/".evolveresuit" ]]; then mkdir ~/".evolveresuit"; fi && git clone https://github.com/franksouza183/EvolvereSuit ~/.evolveresuit/`

Then to get updates:

`cd ~/".evolveresuit" && git pull origin master && cd`

# PPA

Many thanks to NoobsLab for this:

> sudo add-apt-repository ppa:noobslab/evolvere 
> sudo apt-get update 
> sudo apt-get install evolvere-icon-suite