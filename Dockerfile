FROM resin/rpi-raspbian:stretch

RUN apt-get update -y && \
    apt-get install -y ca-certificates git wget apt-transport-https vim nano && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN curl -s https://packages.gitlab.com/install/repositories/runner/gitlab-runner/script.deb.sh | sudo bash && \
    # Desired: https://packages.gitlab.com/runner/gitlab-runner/packages/raspbian/buster/gitlab-runner_11.8.0_armhf.deb
    sudo apt-get install gitlab-runner=11.8.0 && \
    curl -L https://github.com/docker/machine/releases/download/v0.16.1/docker-machine-`uname -s`-`uname -m` >/tmp/docker-machine && \
    chmod +x /tmp/docker-machine && \
    sudo cp /tmp/docker-machine /usr/local/bin/docker-machine

VOLUME ["/etc/gitlab-runner", "/home/gitlab-runner", "/var/run/docker.sock"]
ENTRYPOINT ["gitlab-runner"]
CMD ["run", "--user=gitlab-runner", "--working-directory=/home/gitlab-runner"]