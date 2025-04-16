# DevContainer Dockerfiles

This repository contains Dockerfiles for setting up various development environments including Rust, C++, Latex, and Java. These environments were originally designed to be used within containers to provide consistency and ease of recreation across different Linux distributions, especially when frequently switching (distro hopping).

## Purpose

The initial goal of this project was to streamline the process of setting up development environments by containerizing them, allowing for:

- Quick setup after switching Linux distributions.
- Isolated and reproducible development environments.
- Compatibility with tools like VSCode DevContainers.

## Current Status

This idea has been abandoned. The containers have been replaced by a more flexible and scalable solution using [Ansible](https://www.ansible.com/), which allows for system-wide configuration and provisioning.

However, the Dockerfiles are still available in this repository as a reference and may still be useful for:

- Learning how to set up language-specific environments in containers.
- Bootstrapping new container-based development environments.
- Using as a fallback when a full Ansible setup is not available.

## How to Use

You can build any of the Dockerfiles using:

```bash
docker build -t dev-<language> -f Dockerfile.<language> .
```

Replace `<language>` with the desired environment (e.g., `rust`, `cpp`, `python`, `java`).

## License

This repository is open-source and available under the MIT License.

