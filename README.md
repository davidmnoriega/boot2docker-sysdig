# boot2docker-sysdig

This is an extension of the boot2docker image that contains sysdig in the base VM. For convenience sake, SUID has been set for the sysdig binaries. 

## Usage
To have docker-machine use this image for boot2docker, you need to provide it the url to the release, replacing _drivername_ with your driver of choise, like virtualbox or vmwarefusion.

    $ docker-machine create dev --drivername-boot2docker-url https://github.com/davidmnoriega/boot2docker-sysdig/releases/download/v1.0/boot2docker-sysdig.iso

Now that its up and running, you can ssh in and run sysdig/csysdig

    $ docker-machine ssh dev
    docker@boot2docker:~$ csysdig
