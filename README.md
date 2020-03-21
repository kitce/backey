# Backey
Background slideshow with random images on multiple screens on Linux

## Why
This feature is what modern desktop environments (e.g. GNOME, KDE) lack of.

I had tried some software like [Hydrapaper](https://github.com/gabmus/hydrapaper) and [Superpaper](https://github.com/hhannine/Superpaper), both of them do not suit my case. 

I think they are not very customizable, and every Linux user have a feeling of wanting to control everything, right?

I just simply want something I can easily do on Windows and macOS (i.e. background slideshow with random images on multiple screens).

## How it works

This script selects number of images from the specific directory randomly and merge them into a single image to be set as the background across the monitors.

Then use [cron](https://en.wikipedia.org/wiki/Cron) to do the "slideshow" magic.

## Usage

1. Clone this repository
```bash
# ~
$ git clone git@github.com:kitce/backey.git
```

2. Prepare a directory containing you favorite background images
```
# for example
~/Pictures/Backgrounds
```

3. Set necessary environment variables
```bash
# ~/.backey.env
export BACKEY_NUM_SCREEN=2                          # number of screens in your setup
export BACKEY_SCREEN_RESOLUTION=1920x1080           # resolution of your screens
export BACKEY_IMAGE_DIR=$HOME/Pictures/Backgrounds  # directory of the background images
# notice that "$HOME" is used for making an absolute path
```

4. Make `backey.sh` executable
```bash
$ chmod +x ~/backey/backey.sh
```

5. At this point, you can try the script
```bash
$ . ~/.backey.env               # export the environment variables
$ ~/backey/backey.sh            # nothing output means no error
```

6. Go to background settings
7. Select `~/.cache/backey/merged.jpg` as the background
8. Select "Spanned" as the adjustment mode

You should now see the randomly selected images are set as backgrounds on multiple screens.

Everytime you execute the script, it selects the images randomly again.

9. Install any cron implementation you like
```bash
# for example, cronie on Arch Linux
$ sudo pacman -S cronie
```

10. Edit your crontab
```bash
$ crontab -e
# you may want to use specific text editor
$ EDITOR=nano crontab -e
```
```
# you will need to export ~/.backey.env in crontab for Backey to work
# for example, change backgrounds every minute
* * * * * . $HOME/.backey.env; $HOME/backey/backey.sh
```
Visit [crontab guru](https://crontab.guru/) to learn more about setting the schedule

11. WOW

You have a background slideshow with random images on mulitple screens now.

## Limitations
- Currently only support screens with same resolution
- Currently only support horizontal screen arrangement on the same Y-axis

## License
MIT License
