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

## Register runner

    docker run --rm -t -i -v /srv/gitlab-runner/config:/etc/gitlab-runner alxda/rpi-gitlab-runner register \
  --non-interactive \
  --executor "docker" \
  --docker-image resin/rpi-raspbian:stretch \
  --url "https://gitlab.com/" \
  --registration-token "PROJECT_REGISTRATION_TOKEN" \
  --description "docker-runner" \
  --tag-list "docker,aws" \
  --run-untagged \
  --locked="false"


Reference:
    https://docs.gitlab.com/runner/register/index.html#docker
    https://wwsean08.com/2018/06/setting-up-a-gitlab-runner-on-a-raspberry-pi-in-kubernetes/