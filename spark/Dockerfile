FROM apache/spark:3.5.6

USER root

# Install bash completion
RUN apt-get update && \
    apt-get install -y bash-completion && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Configure bash completion
RUN echo 'source /etc/bash_completion' >> /root/.bashrc && \
    echo 'if [ -f /etc/bash_completion ]; then source /etc/bash_completion; fi' >> /home/${USER}/.bashrc

USER ${USER}
WORKDIR /opt/spark/data
