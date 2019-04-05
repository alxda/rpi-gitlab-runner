# rpi-gitlab-runner

## Run container
    docker run --rm -t -i alxda/rpi-gitlab-runner


## Configuration

    docker run -d --name rpi-gitlab-runner --restart always \
    -v /srv/gitlab-runner/config:/etc/gitlab-runner \
    -v /var/run/docker.sock:/var/run/docker.sock \
    alxda/rpi-gitlab-runner

    Reference:
    https://docs.gitlab.com/runner/install/docker.html