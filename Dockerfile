FROM alpine:3.11
ENV ANSIBLE_VERSION 2.9.5
ENV JINJA2_VERSION 2.7.2

RUN apk update \
    && apk add --no-cache unzip curl tar bash \
    python make bash vim jq  \
    openssl openssh-client sshpass  \
    gcc libffi-dev python-dev musl-dev openssl-dev py-pip py-virtualenv \
    git coreutils less bash-completion \
    libc6-compat && \
    rm -rf /var/cache/apk/* && \
    mkdir -p /etc/bash_completion.d/ /etc/profile.d/

# Install Ansible
RUN pip install ansible==${ANSIBLE_VERSION} Jinja2==${JINJA2_VERSION} && \
    rm -rf /root/.cache && \
    find / -type f -regex '.*\.py[co]' -delete

COPY scripts/entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

WORKDIR /home/ansible-container

ENTRYPOINT ["/entrypoint.sh"]