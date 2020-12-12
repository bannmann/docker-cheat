docker-cheat
============

`docker-cheat` provides a single docker image for [cheat](https://github.com/cheat/cheat) and its
[community-sourced cheatsheets](https://github.com/cheat/cheatsheets) to simplify installation.


Prerequisites
-------------
- Docker


Installation
------------
1. Create a `cheat` alias by adding the following line to `~/.profile`:
    ```
    alias cheat='docker run --rm bannmann/docker-cheat'
    ```
2. Rejoice!


Updating
--------
Using the command above will not pick up new image versions automatically. To do that, execute the following command
manually:

```
docker pull bannmann/docker-cheat
```

You could automate this process using a cron job, but make sure that cron only emails the command output in case of
errors.


Using custom cheatsheets
------------------------

In addition to the [community cheatsheets](https://github.com/cheat/cheatsheets), you can use custom cheatsheets by
mapping directories to the following paths inside the docker image: 

 - `/v/personal` for your personal cheatsheet directory
 - `/v/workdir` for the current working directory (see
   [Directory-scoped Cheatpaths](https://github.com/cheat/cheat#directory-scoped-cheatpaths))

To use both options, set up your `cheat` alias as follows:
```
alias cheat='docker run -v ~/.cheat:/v/personal:ro -v $(pwd):/v/workdir:ro --rm bannmann/docker-cheat'
```


Limitations
-----------
- `cheat` configuration settings are currently [hard-coded](src/conf.yml) inside the container.
- Although the [`latest` tag on Docker Hub](https://hub.docker.com/r/bannmann/docker-cheat/tags) is rebuilt for each
  new commit on the `master` branch, new versions of the `cheat` binary and cheatsheets are not picked up
  automatically yet. Instead, every once in a while, the respective definitions (`Dockerfile` and the `cheatsheets`
  submodule) will be updated with a manual commit. This will probably be automated at some point.
