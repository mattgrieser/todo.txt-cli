
For *Windows* [Download and install Cygwin](https://cygwin.com/install.html). Cygwin provides a Unix-environment for Windows; Todo.txt needs just the Bash shell and some common Unix tools, so a minimal installation will do just fine. (Another suggestion is to use Git on windows - it's smaller and has a sh builtin: [Git on Windows](https://git-scm.com).)

For *MacOS* it is simpler to use the defacto package management tool [Homebrew](https://brew.sh) . See [below](#macos-using-homebrew) for how.

---

# Installation

1. [Download the latest stable release of Todo.txt CLI](http://github.com/todotxt/todo.txt-cli/releases) (available as a ZIP or TAR archive) and extract it.

2. Open a command window. On Windows, this is _Cygwin Bash Shell_ (_not_ Command Prompt!); elsewhere, this is often called _Terminal_. It usually presents you with a `$` prompt. `cd` into the directory where you extracted todo.sh. Make the todo.sh script executable:

```bash
$ chmod +x todo.sh
```

3. Type `./todo.sh` to see the usage message. You're ready to go!  To start adding tasks, type `./todo.sh add "My new task"`

## Optional

4.  Install the Bash completion, either system-wide, for all users:

```bash
$ sudo cp todo_completion /etc/bash_completion.d/todo
```

_or_ put it somewhere in your home directory and source it from your `.bashrc`:

```bash
$ source todo_completion
```

Now you can type `$ ./todo.sh ad<Tab>` and Bash will autocomplete the action to `$ ./todo.sh add`. Any words that begin with + or @ will be completed using projects or contexts, respectively. Task numbers will append the task text as a shell comment.

Note: If you define an alias (e.g. `t`) to todo.sh, you need to explicitly enable completion for it, too (also put this into your `.bashrc`):

```bash
$ complete -F _todo t
```

## MacOS: Using Homebrew

1. Download the latest version by running 
```bash 
brew install todo-txt
```

2. By default brew installs packages on `/usr/local/opt/` , so you'll need to copy the config file to HOME by running 
```bash
 cp /usr/local/opt/todo-txt/todo.cfg ~/.todo.cfg 
```

3. Next you'll want to configure the directory where your todos will be created, otherwise they'll be created on ` /usr/local/bin ` by default (or wherever todo.sh is located). Open `.todo.cfg` in your favourite text editor and edit the path variable `TODO_DIR`

*Note :* Auto completion will be automatically installed , but you'll still need to enable it if you aliased `todo.sh` 

# Help 


- Want more? See the full list of configuration tweaks, enhancements and recommendations on the [[Tips and Tricks]] page.

- Something missing? Todo.txt is extensible; many users have already written Add-ons listed on the [[Todo.sh Add on Directory]] page.

- Having problems? Have a look at the [[Troubleshooting]] page, or ask on the in the [discussions group](https://github.com/todotxt/todo.txt-cli/discussions)
