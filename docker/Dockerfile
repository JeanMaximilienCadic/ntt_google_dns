FROM python:3.6-slim

## Add foo user
RUN apt update && \
    apt install nano sudo --no-install-recommends -y & \
    adduser --disabled-password --gecos '' foo & \
    adduser foo sudo && \
    echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers && \
    echo 'export PYTHONPATH=/workspace' >> /home/foo/.bashrc

# Import the package
WORKDIR /workspace
RUN python -m pip install --upgrade pip & \
    echo "export PYTHONPATH=/workspace" >> /root/.bashrc

# Copy code and requirements
COPY google_dns /workspace/google_dns
COPY requirements.txt /workspace/

# Install deps and remove cache
RUN pip install -r /workspace/requirements.txt &\
    rm -rf /var/lib/apt/lists/*

# Switch to foo
RUN chown -R foo /workspace
USER foo

CMD ["python", "-m", "google_dns"]
