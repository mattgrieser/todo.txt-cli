Todo.sh add-ons let you add new todo.sh actions or change (override) default actions.  See [[Creating and Installing Add-ons]] for more info.

## Example: overriding a built-in command

Here is one example to override the "add" command. This is done in bash but note that you can do it in any language you want (in which case parsing the config file may be a bit harder).

### Proposed features:

We'll allow to add an item and mark it as done in one shot with the following syntax:

```bash
$ todo.sh add x Helping colleague to install Linux
```

Why such a feature? Because some of us are using todo.sh to track all their activities, not only those which are planned for later, therefore "to do". Why "x" and not just "do"? Because there is a big risk that some of the actual todos will start with "Do something...", and "x" comes from the "x" marker put on done items by `todo.sh do`.

And as we're hacking the "add" anyway, let's also allow to set a priority when adding an item using the following syntax:

```bash
$ todo.sh add pri A "Need to write plugin example on Gina's wiki"
```

### Implementation:

The first argument is either the action itself or the keyword "usage", in which case we'll display some help and exit:

```bash
#!/bin/bash

action=$1
shift

[ "$action" = "usage" ] && {
  echo "  Customized add:"
  echo "    add pri PRIORITY \"THING I NEED TO DO +project @context\""
  echo "    add p PRIORITY \"THING I NEED TO DO +project @context\""
  echo "      add an item and prioritize it in one step"
  echo "    add x \"THING I NEEDED TO DO RIGHT NOW\""
  echo "      add an item and mark it as done in one step"
  echo ""
  exit
}
```

Then the core of our customized action: are we in the regular "add" case or in the custom cases of marking the item as done immediately or prioritized immediately?

```bash
PRIORITY=false
DO=false
if [ x"$1" = x"pri" -o x"$1" = x"p" ] && [[ x"$2" = x[a-zA-Z] ]]; then
    PRIORITY=$2
    shift
    shift
elif [ x"$1" = x"x" ]; then
    DO=true
    shift
fi
```

Doing what we've to do: here the environment variable $TODO_SH can be used to call back the `todo.sh` script wherever it is and no matter how it's called. 

Because we want to use the original built-in "add" we call todo.sh with the action "command add" in the same spirit of the bash "command".
As we've sourced the config file, the todo file is reachable with `$TODO_FILE`.

```bash
if "$TODO_SH" command add "$@"; then
    # getting the number item: it's simply the last item added to the file
    line=`wc -l "$TODO_FILE" | cut -d' ' -f1`
    [ $PRIORITY != false ] && "$TODO_SH" command pri "$line" $PRIORITY
    $DO && "$TODO_SH" command do "$line"
fi
```
