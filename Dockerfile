# Use the official Alpine base image
FROM alpine:edge

# Install necessary packages
RUN apk add --no-cache bash 
RUN apk add --no-cache gcc        # Required for neovim. Do not remove
RUN apk add --no-cache musl-dev   # Required for neovim. Do not remove
RUN apk add --no-cache make 
RUN apk add --no-cache curl       # Required for neovim. Do not remove
RUN apk add --no-cache wget       # Required for neovim. Do not remove
RUN apk add --no-cache gzip       # Required for neovim. Do not remove
RUN apk add --no-cache ripgrep    # Required for neovim. Do not remove
RUN apk add --no-cache tree 
RUN apk add --no-cache git 
RUN apk add --no-cache npm        # Required for neovim. Do not remove
RUN apk add --no-cache neovim
RUN apk add --no-cache neovim-doc # Required for neovim. Do not remove

# Set up directories for NvChad
RUN mkdir -p /root/.config/nvim

# Clone the customized NvChad
RUN git clone https://github.com/vnvim/nvchad-custom /root/.config/nvim

# Set working directory
WORKDIR /workspace

# Start Neovim by default
CMD ["nvim"]
