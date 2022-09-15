from setuptools import setup
from gnutools import __version__

setup(
    name="google_dns",
    version=__version__,
    packages=[
        "google_dns",
    ],
    url="https://github.com/JeanMaximilienCadic/google_dns",
    license="MIT",
    author="Jean Maximilien Cadic",
    python_requires=">=3.6",
    install_requires=[r.rsplit()[0] for r in open("requirements.txt")],
    author_email="git@cadic.jp",
    description="GNU Tools for python",
    classifiers=[
        "Programming Language :: Python :: 3.6",
        "License :: OSI Approved :: MIT License",
    ],
)
