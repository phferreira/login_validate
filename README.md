# Login validate example


## Running this project

You can run this function example on your own machine using Docker to simulate
running in a hosted environment.

```shell
$ docker build -t login_validate .
...

$ docker run -it -p 4325:8080 --name app login_validate
Listening on :4325
```

## Clean up

When finished, clean up by entering:

```shell
docker rm -f app               # remove the container
docker image rm login_validate # remove the image
```
