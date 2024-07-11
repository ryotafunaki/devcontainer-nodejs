# Copyright (c) 2024 RFull Development
# This source code is managed under the MIT license. See LICENSE in the project root.
FROM ryotafunaki/devcontainer-nodejs:sdk-20

# Install development tools for root
USER root
WORKDIR /root
COPY ./root_shells/ ./shells/
RUN cd ./shells && \
    chmod +x install.sh && \
    ./install.sh && \
    cd ..
RUN rm -rf ./shells

# Switch to the non-root user
ARG USER_NAME=developer
USER ${USER_NAME}
WORKDIR /home/${USER_NAME}

# Install development tools for non-root
COPY --chown=${USER_NAME}:${USER_NAME} ./user_shells/ ./shells/
RUN cd ./shells && \
    chmod +x install.sh && \
    ./install.sh && \
    cd ..
RUN rm -rf ./shells
