# boot2docker-sysdig

This is an extension of the boot2docker image that contains sysdig in the base VM. For convenience
sake, SUID has been set for the sysdig binaries.

## Usage

To have docker-machine use this image for boot2docker, you need to provide it the url to the
release, replacing _drivername_ with your driver of choise, like virtualbox or vmwarefusion.

    $ docker-machine create -d drivername --drivername-boot2docker-url https://github.com/davidmnoriega/boot2docker-sysdig/releases/download/1.1-0.4.0/boot2docker-sysdig.iso dev

Now that its up and running, you can ssh in and run sysdig/csysdig

    $ docker-machine ssh dev
    docker@boot2docker:~$ csysdig

## Building local iso

docker build -t boot2docker-sysdig .
docker run boot2docker-sysdig > boot2docker.iso

## Creating docker-machine from local iso

    $ docker-machine create -d drivername --drivername-boot2docker-url PATH/TO/boot2docker-sysdig.iso dev

### Notice

By default on Mac, `TERM` is set to `xterm-256color` which doesn't work with other linux systems.
You'll need to use either `xterm` or `xterm-color`
