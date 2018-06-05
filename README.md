Threat Hunter
=============

This will run [YARA](http://virustotal.github.io/yara/) in container [docker](https://www.docker.com/), as a requirement will need docker and [docker-compose](https://docs.docker.com/compose/) installed.

# Usage

You can use `docker commands` manually or can make usage of Makefile commands, to quick run:

```bash
$ make build SAMPLES_DIR=/srv/laboratorio/data
$ make up
```

The `make build` line will build the docker images and create a `.env` file setting up the `SAMPLES DIR` to `/srv/laboratorio/data` (This is were my samples as stored, change here as you need).

The `make up` will run the container in background (using docker-compose) and after it will connect to it, you can run `make up` multiple times, if no change happens, will not trigger a new build and the container always will run in background. If a new build happens, the container will be recreated.

In container the samples directory (SAMPLES_DIR) will be mapped in `/srv/data`

## Yara rules

We make usage of [Yara-Rules](https://github.com/Yara-Rules/rules) repository as a submodule, the rules can be found in `/srv/rules` in container.

To pull or update this, run:

``` bash
$ make update
```

Tip. Clone with --recursive parameter.
