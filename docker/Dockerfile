FROM python:3.6-slim

## Add foo user
RUN apt update -y && apt install nano sudo --no-install-recommends -y
RUN adduser --disabled-password --gecos '' foo
RUN adduser foo sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
RUN echo 'export PYTHONPATH=/workspace' >> /home/foo/.bashrc

# Import the package
WORKDIR /workspace
RUN python -m pip install --upgrade pip
RUN echo "export PYTHONPATH=/workspace" >> /root/.bashrc
COPY google_dns /workspace/google_dns
COPY requirements.txt /workspace/
RUN pip install -r /workspace/requirements.txt
RUN rm -rf /var/lib/apt/lists/*

# Switch to foo
RUN chown -R foo /workspace
USER foo

CMD ["python", "-m", "google_dns"]
