#!/bin/bash

# This script (nhentai-net) is released under the
# Creative Commons CC-0 license, a digital copy
# of which can be found here:
# https://creativecommons.org/publicdomain/zero/1.0/legalcode.txt

# This is for downloading nhentai manga.
# Yes, really. I made this while I was 
# particularly horny one night, and wanted to 
# try and hone my shell scripting
# skills.

# Firstly, here's the ID of your gallery.
# No, not the ID of the comic, the ID
# of the comics *gallery.* That's a
# different thing. You can find that
# by looking at the URL of an
# image. Take for instance #177013
# The gallery ID for it is #987560.
# As you can see for the URL of
# page number one:
#
# i.nhentai.net/galleries/987560/1.jpg
#                         ~~~~~~
# ...Yes, this is rather convoluted.

echo "Enter the gallery ID:"
read -r
id=$REPLY

# Now, here are the pages. This is much, much
# more straightforward, thankfully.
# X is the starting page, Y is the ending page.

x=1

echo "Page number:"
read -r

y=$REPLY

# This is the worst way to impliment something like
# this, but I really couldn't have cared less.
#
# Basically, the url of the image is reciveved,
# Wget retrives it, and the count of X goes up
# by one. if Wget directly recieves a 404,
# it tries to look for a PNG instead of a JPG. 
# This wouldn't be too bad, if it didn't run
# BOTH of these commands in order, regardless
# of if something is all JPG, or all PNG. There's
# a better way to do this, obviously, but I'm
# not going to waste my time with something
# this stupid.
# ...
# also the entire way the loop is implimented is
# just kinda...bad. Slow. Counter-intuitive.
# Whatever negative phrase you could
# think of is probably applicable to this.

while [ $x -le $y ]
do
    url="https://i.nhentai.net/galleries/"$id"/"$x".jpg" # First attempt.
    url="https://i.nhentai.net/galleries/"$id"/"$x".png" # Second attempt.

    wget $url

    ((x++))
done

# That's all.
