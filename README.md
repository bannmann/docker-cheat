docker-cheat
============

`docker-cheat` provides a single docker image for [cheat](https://github.com/cheat/cheat) and its
[community-sourced cheat sheets](https://github.com/cheat/cheatsheets) to simplify installation.


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


Fine print
----------
- Although the [`latest` tag on Docker Hub](https://hub.docker.com/r/bannmann/docker-cheat/tags) is rebuilt for each
  new commit on the `master` branch, new versions of the `cheat` binary and cheat sheets are not picked up
  automatically yet. Instead, every once in a while, the respective definitions (`Dockerfile` and the `cheatsheets`
  submodule) will be updated with a manual commit. This will probably be automated at some point.
- `cheat` configuration settings are currently [hard-coded](src/conf.yml) in the container.
- Custom cheat sheets, including writable ones, are not supported yet. However, this could be changed easily by adding a
  container directory to the `conf.yml` which can then be mapped to a host directory by the user.
