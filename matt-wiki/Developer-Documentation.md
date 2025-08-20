To contribute to Todo.txt CLI, *fork [the repository](http://github.com/todotxt/todo.txt-cli)* and make your changes, including tests. *Then issue a pull request* via GitHub to submit your changes for review and possible inclusion in the master. Big or disruptive changes are best discussed on the [mailing list](http://groups.yahoo.com/group/todotxt/) first. 

* [[Creating Add-ons: Examples]]
* [[Using the Makefile]]
* [Known Bugs](http://github.com/todotxt/todo.txt-cli/issues)

## Contributing patches and enhancements via Git / GitHub

### Initial Fork

You need to register on GitHub first - it's free and quick to do. After registering, you need to add your SSH public keys to be able to push your changes to your repository. On the [Todo.txt GitHub pages](http://github.com/todotxt/todo.txt-cli/), click the _Fork this project_ button. This will create your personal fork `git@github.com:username/projectname.git`. 

On your dev system, install Git and clone your repository: 

```bash
$ git clone git@github.com:username/todo.txt-cli.git
```

We'll add Gina's authoritative repository as _upstream_, so that you can easily sync with it: 

```bash
$ git remote add upstream git://github.com/todotxt/todo.txt-cli.git
$ git fetch upstream
```

### Publishing Changes

```bash
$ git add ...
$ git commit ...
$ git push origin master
```

The changes now appear in your repository in your GitHub clone; you'll see the commits listed in the GitHub web interface. You can now initiate a pull request by clicking the _Pull Request_ button. Send the request to the maintainers. You will receive a message (in GitHub and via Email) when she has merged in your changes; or just occasionally check [the changelog]. 

### Pulling in Upstream

Some time has passed, the upstream repo has changed and you want to update your fork before you submit a new patch. Do this to bring your dev system up-to-date: 

```bash
$ git fetch upstream
$ git merge upstream/master
```

[the changelog]: https://github.com/todotxt/todo.txt-cli/blob/master/CHANGELOG.md

