# ansible-container

# Packer build files for Centos base images

## Pre-requisites
* Container Runtime (Any one of these: Docker, Podman, Kubernetes)

## How to use
* Clone the ansible-container repository
* Navigate to `playbooks/` directory
* Clone the ansible playbooks/roles/collections in the `playbooks/` directory
* Navigate back to the ansible-container root directory
* Build the container image: 
    * Docker: `docker build . -t ansible-container:test`
    * Podman/Buildah : `buildah bud -t ansible-container:test .`
* Run the container image: 
    * Docker: `docker run --rm -dt --name ansible-container --volume ${PWD}/playbooks/:/home/ansible-container/ ansible-container:test`
    * Podman/Buildah : `podman run --rm -dt --name ansible-container --volume ${PWD}/playbooks/:/home/ansible-container/ ansible-container:test`
* Exec into the container and use ansible:
    * Docker: `docker exec -it ansible-container sh`
    * Podman: `podman exec -it ansible-container sh`

## Built with
* Docker
* Ansible

## References
* [Docker v18.09.1 ](https://docs.docker.com/)
* [Ansible v2.9.5](https://docs.ansible.com/ansible/latest/roadmap/ROADMAP_2_9.html)
* [Podman v1.8.2](https://github.com/containers/libpod)
* [Buildah v1.14.8](https://github.com/containers/buildah)