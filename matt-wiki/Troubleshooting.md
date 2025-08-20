# Troubleshooting

## Common Issues

### Configuration File Error

**Problem:** I get "Fatal Error: Cannot read configuration file
/Users/myusername/.todo/config" when launching todo.sh

**Solution:** Create the `~/.todo/config` file manually. Here's some example content:

```bash
export TODO_DIR="$HOME/Dropbox/todo"
export TODO_FILE="$TODO_DIR/todo.txt"
export DONE_FILE="$TODO_DIR/done.txt"
export REPORT_FILE="$TODO_DIR/report.txt"
export TMP_FILE="/tmp/todo.tmp"
export TODOTXT_DEFAULT_ACTION=ls
```

Alternatively, if you have cloned the repository, issue
`cp todo.cfg ~/.todo/config` in the `todo.txt-cli` directory to use the
default config file (Linux).
