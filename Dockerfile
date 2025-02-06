# Use the official Alpine base image
FROM alpine:latest

# Install necessary packages
RUN apk add --no-cache \
    bash \
    git \
    neovim \
    build-base \
    ninja \
    cmake \
    libtool \
    pkgconfig \
    curl \
    ripgrep \
    fd \
    tree

# Set up directories for NvChad
RUN mkdir -p /root/.config/nvim

# Clone the NvChad repository
RUN git clone https://github.com/NvChad/starter ~/.config/nvim

# Set working directory
WORKDIR /workspace

# Start Neovim by default
CMD ["nvim"]
