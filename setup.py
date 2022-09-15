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
