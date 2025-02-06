# Use the official Alpine base image
FROM alpine:latest

# Install necessary packages
RUN apk add --no-cache \
    bash \
    git \
    gcc \
    musl-dev \
    make \
    curl \
    ripgrep \
    tree \
    neovim

# Set up directories for NvChad
RUN mkdir -p /root/.config/nvim

# Clone the customized NvChad
RUN git clone https://github.com/vnvim/nvchad-custom /root/.config/nvim

# Set working directory
WORKDIR /workspace

# Start Neovim by default
CMD ["nvim"]
