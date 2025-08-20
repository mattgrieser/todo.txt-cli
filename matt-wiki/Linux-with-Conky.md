Conky is a system monitor for X, that can also display the output of shell commands. Setting up Conky is generally a simple process of installing it from your Linux distribution's repository. 

Displaying your todo.txt file on your desktop is a simple task thanks to Conky. The most basic code to display the todo.txt file is: `${execpi 10 todo.sh -p ls}` This will cause your todo.txt file to be displayed as it would from the command line, minus the color, and it will refresh every 10 seconds. Using the grep command you can get a bit more fancy and color code your todo items.

Unless you want your todo list to be truncated, you will also need to play with the `text_buffer_size variable` in your `.conkyrc` file. The default setting is 128 bytes, but I found that to be inadequate for my todo.txt file, so I raised the variable to 1024 bytes. The higher your `text_buffer_size`, the more resources that Conky will use, so raise sparingly.

![](http://farm4.static.flickr.com/3316/3343839756_612804f1fe_o.png)

## Coloring

The approach by Duane Hubbard uses a wrapper `color_todo.sh` script that augments the plain todo.txt output with Conky's `${color yellow}` tags. Starting with todo.txt v 2.7, one can simply redefine todo.txt's built-in color map to achieve the same effect. No wrapper and postprocessing is needed, and this will work together with the new feature of highlighting more than priorities A, B & C. 

Add a separate todo.txt configuration in `~/.todo/config-conky`: 

```
# todo.txt configuration for Conky highlighting. 
export BLACK='${color black}'
export RED='${color red}'
export GREEN='${color green}'
export BROWN='${color brown}'
export BLUE='${color blue}'
export PURPLE='${color purple}'
export CYAN='${color cyan}'
export LIGHT_GREY='${color LightGrey}'
export DARK_GREY='${color DarkGrey}'
export LIGHT_RED='${color LightRed}'
export LIGHT_GREEN='${color LightGreen}'
export YELLOW='${color yellow}'
export LIGHT_BLUE='${color LightBlue}'
export LIGHT_PURPLE='${color LightPurple}'
export LIGHT_CYAN='${color LightCyan}'
export WHITE='${color white}'
export DEFAULT='${color}'
source ~/.todo/config # Adapt this to wherever your todo.txt configuration is located.
```

Inside `~/.todo/config` the color map defaults must _not_ be uncommented, or they'll override the above setting again! On the other hand, the `PRI_...` defaults _must_ be overridden in there, or else todo.txt will still use the defaults built into the script itself, using the inital color definitions. The execution order of the configurations is `todo.sh` -> `config-conky` -> `config`. 

To summarize, your `~/.todo/config` needs to looks like this: 

```
# === COLOR MAP ===
# -> commented out!
# export BLACK='\\033[0;30m'
# export RED='\\033[0;31m' 
# ... snip ...

# === COLORS ===
# -> defaults overridden!
export PRI_A=$YELLOW        # color for A priority
export PRI_B=$GREEN         # color for B priority
# ... snip ...
```

Embed the todo.txt call with this special configuration inside your `.conkyrc` (see below for an example `.conkyrc` file): `${execpi 10 todo.sh -d ~/.todo/config-conky ls`

![](http://farm4.static.flickr.com/3561/3343839752_b7e47f7c16_o.png)


## Resources

[conkyrc files by Duane Hubbard](http://github.com/duanehubbard/conky-files)

---

Example `~/.conkyrc` for Conky 1.8.0 on Ubuntu Lucid with todo.txt v 2.6

```
# Conky, a system monitor embedding into the Linux desktop. 
#
# Compiz may decorate the embedded Conky window. 
# To avoid that a shadow is drawn around the Conky information: 
# 1. Open the CompizConfig manager (System > Settings > CompizConfig manager). 
# 2. Choose Effects > Window decoration
# 3. Set the rule to the following: (any) & !(class=Conky). 
#    It means: decorate any window but not those with class Conky. 
alignment top_left
border_width 0
default_color Grey
default_outline_color white
default_shade_color white
double_buffer yes
draw_borders no
draw_graph_borders yes
draw_outline no
draw_shades no
gap_x 320
override_utf8_locale
own_window yes
own_window_transparent yes
# This avoids that the Conky background disappears when clicking on the desktop. 
own_window_type override
text_buffer_size 65536
use_xft yes
xftfont Courier:size=10

TEXT
${execpi 120 todo.sh -d ~/.todo/config-conky ls}
```
