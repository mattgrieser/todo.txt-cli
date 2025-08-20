This page contains some usage information for common tasks when using Todo.txt CLI.

## Exclude terms using `list`

You can exclude words, contexts and projects from a `todo list` using the `-` operator, for example, to find things you need to send, except those by email:

```bash
$ todo ls "send -email"
14 Send Father's day card
11 Send keys back @postoffice
--
TODO: 2 of 19 tasks shown
```

This can also be used on projects and operators:

```bash
$ todo ls "download update -@home"
02 Download the new vm software @work
09 Update Twitter app @phone
--
TODO: 2 of 19 tasks shown
```

Note that while on search engines `+` will force a term to be included, this is a simple search tool and `+`s are used for projects.