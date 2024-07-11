# Copyright (c) 2024 RFull Development
# This source code is managed under the MIT license. See LICENSE in the project root.
FROM ryotafunaki/devcontainer-nodejs:sdk-20
ARG USER_NAME=developer

# Switch to root user to install global packages
# NOTE: sudo is not working in this image
USER root
RUN npm install -g @nestjs/cli

# Switch back to non-root user
USER ${USER_NAME}
WORKDIR /home/${USER_NAME}

# Install development tools for non-root
COPY --chown=${USER_NAME}:${USER_NAME} ./user_shells/ ./shells/
RUN cd ./shells && \
    chmod +x install.sh && \
    ./install.sh && \
    cd ..
RUN rm -rf ./shells
