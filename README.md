<h1 align="center">
  <br>
  <a href=https://upload.wikimedia.org/wikipedia/commons/e/ee/NTT_company_logo.svg"><img src="https://upload.wikimedia.org/wikipedia/commons/e/ee/NTT_company_logo.svg"></a>
  <br>
  NTT x Google DNS
  <br>
</h1>

<p align="center">
  <a href="#modules">Modules</a> •
  <a href="#code-structure">Code structure</a> •
  <a href="#installing-the-application">Installing the application</a> •
  <a href="#makefile-commands">Makefile commands</a> •
  <a href="#environments">Environments</a> •
  <a href="#running-the-application">Running the application</a>
</p>

This Google DNS package consists of an NTT router IP parser for updating the dynamic DNS of Google domains.

# Modules

| Component | Description |
| ---- | --- |
| **google_dns** | Contains the implementation of Google DNS |


# Code structure

```python
from setuptools import setup

from google_dns import __version__

setup(
    name="google_dns",
    version=__version__,
    packages=[
        "google_dns",
    ],
    url="https://github.com/JeanMaximilienCadic/ntt_google_dns",
    license="MIT",
    author="Jean Maximilien Cadic",
    long_description="".join(open("README.md", "r").readlines()),
    long_description_content_type="text/markdown",
    python_requires=">=3.6",
    install_requires=[r.rsplit()[0] for r in open("requirements.txt")],
    author_email="git@cadic.jp",
    description="Google DNS",
    classifiers=[
        "Programming Language :: Python :: 3.6",
        "License :: OSI Approved :: MIT License",
    ],
)
```

# Installing the application
    
To clone and run this application, you'll need the following installed on your computer:
- [Git](https://git-scm.com)
- Docker Desktop
   - [Install Docker Desktop on Mac](https://docs.docker.com/docker-for-mac/install/)
   - [Install Docker Desktop on Windows](https://docs.docker.com/desktop/install/windows-install/)
   - [Install Docker Desktop on Linux](https://docs.docker.com/desktop/install/linux-install/)
- [Python](https://www.python.org/downloads/)

From the command line, enter the following:

```console
# Clone this repository
git clone https://github.com/JeanMaximilienCadic/ntt_google_dns

# Go into the repository
cd ntt_google_dns
```

## Setting up the config file

Create a config file at `/opt/google_dns/config.yml`. Then, add the following to the file.

```yaml
project: google_dns
url: 'http://<your-router-IP>/ntt/information/fifth/current'
authorization: "dXNlcjphZG1pbg=="
cookie: 'HGWSESSIONID=1hoa40gjlzl2g'

hostnames:
- hostname: "<your-website.com>"
  google_id: "<your-Google-ID>"
  google_password: '<your-Google-password>'
```

# Makefile commands

Exhaustive list of make commands:

```console
build_docker
push_docker
pull_docker
docker_run
checkout
```

# Environments

## Docker

> **Note**
> 
> Running this application by using Docker is recommended.

To build and run the docker image
```console
make build_docker
make docker_run
```

## PythonEnv

> **Warning**
> 
> Running this application by using PythonEnv is possible but *not* recommended.

```console
python setup.py install 
```

# Running the application

To run the application, enter the following from the command line:

```console
python -m google_dns
```
