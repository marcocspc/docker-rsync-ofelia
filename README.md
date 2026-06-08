# docker-rsync-ofelia
My container configuration to run rsync backups scheduled by orfelia.

## How to use

### Dependencies

On your host, of course, you'll need to [install Docker](https://docs.docker.com/desktop/install/linux-install/) and [docker-compose](https://docs.docker.com/compose/install/linux/).

You also need to [install `make`](https://askubuntu.com/questions/161104/how-do-i-install-make) for your distribution.

### How to use

1. First build the image:
```
make build
```

2. Create the configuration file:
```
make config-files
```

3. Check `ofelia_config.ini` for the examples and edit it to match your needs.
4. If you're going to use `rsync` with SSH, you might need to trust the server and record the public key to `known_hosts`. To do that, run:
```
make shell
```
4a. Then run:
```
ssh <user>@<server-ip> -o UserKnownHostsFile=/known_hosts exit
```

5. Once you've configured everything is configured to your liking, run the following to start the container in background:
```
make run-dettached
```

### Testing and debugging

You can run the commands of your backup individually by running:
```
make shell
```

And then executing the commands there.

### Adding a script

You can also add a script to the container and run it inside the container. 

Create your script and save it as `script.sh`.

Uncomment the following line inside `docker-compose.yaml:
```
      #- "./script.sh:/script.sh"
```
