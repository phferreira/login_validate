# Login validate example


## Running this project

You can run this function example on your own machine using Docker to simulate
running in a hosted environment.

```shell
$ docker build -t login_validate .
...

$ docker run --net application_network --name login_validate --env-file ../env_file/file.env -d -p 4525:8080 login_validate

# must be in the same network of get_token and postgres

Listening on :8080
```

## Clean up

When finished, clean up by entering:

```shell
docker rm -f app               # remove the container
docker image rm login_validate # remove the image
```
