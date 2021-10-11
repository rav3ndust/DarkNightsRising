# DarkNightsRising

A simple, text-based adventure game with TTS. Aims to be playable on any Linux distribution, with minimal dependencies.

The entire thing is written in shell script, and the game works together as a family of shell scripts. 
Variables that need to be called through different scripts are done through a automatically generated "variables.txt" file. 

Dark Nights Rising is going to be about isolation and how the feeling of loneliness can pervade your mind. The player aims to escape this situation through a series of fantasy scenarios that are affected by choices the player makes as the game goes on. 

I would eventually like to make an accompanying soundtrack for this little game. 
Dark Nights Rising is free and open-source software licensed under the MIT license, and you can feel free to help make it better by contributing. 

I would eventually like to make this something fun to play on Linux desktops and Linux phones, regardless of which distro they are running on.

**I should note that I am also planning on working on a port of this game to Python to make it a little more portable to other systems, as well as to give it a bit of a nicer graphical user interface.**

**I will be working on this over time.**

# dependencies

*dialog*, *mpg123*, and *flite*. These programs should be available in every major Linux distribution's repositories. 

When work on the installation script for the game is finished, I will hope to have it check for the dependencies and auto-install them if they aren't already on the player's machine. 

# how to play

You can play the game just by making sure you have these two dependencies installed on your machine: 
    - dialog
    - flite
    - mpg123
To launch the game, just run it as you would any other Bash script on your system. 

Make sure you type in your responses EXACTLY AS THEY APPEAR in the prompts when playing the game. At the moment, player responses *are* case-sensitive. I hope to fix this as development on the game goes on. 

Remember, this game is still a WIP, and is a side project. It has no funding and is simply being done for fun. Therefore, you can expect to find new bits of the game added to this repo every now and then if you enjoy playing it. When it is finished, I will aim to have some kind of actual "release" for it. 

If you do enjoy the game and want to help make it better faster, then the next section is for you. 

# contributing

This game is free and open-source software licensed under the MIT license. You are free to do whatever you would like with it. If you'd like to help me make it better, please fork it, add whatever you would like, and send in your changes! If they are awesome and make sense with the concept of the game, I will merge them in. 

# TODO

I am thinking of adding in a soundtrack of sorts for this game to add to the spook factor. I have all kinds of original ambient music I could use for this - I just need to figure out how to make it work best. If anyone reading this has some cool music they would like to add to a FOSS text-based game, let me know. 
