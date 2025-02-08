# Use the official Alpine base image
FROM alpine:edge

# Install necessary packages
RUN apk add --no-cache bash 
RUN apk add --no-cache gcc             # Required for neovim. Do not remove
RUN apk add --no-cache musl-dev        # Required for neovim. Do not remove
RUN apk add --no-cache make 
RUN apk add --no-cache curl            # Required for neovim. Do not remove
RUN apk add --no-cache wget            # Required for neovim. Do not remove
RUN apk add --no-cache gzip            # Required for neovim. Do not remove
RUN apk add --no-cache ripgrep         # Required for neovim. Do not remove
RUN apk add --no-cache tree 
RUN apk add --no-cache git             # Required for neovim. Do not remove
RUN apk add --no-cache npm             # Required for neovim. Do not remove
RUN apk add --no-cache zip             # Required for neovim. Do not remove
RUN apk add --no-cache unzip           # Required for neovim. Do not remove
RUN apk add --no-cache neovim
RUN apk add --no-cache neovim-doc      # Required for neovim. Do not remove

# Set up directories for NvChad
RUN mkdir -p /root/.config/nvim

# Clone the customized NvChad
RUN git clone https://github.com/vnvim/nvchad-custom /root/.config/nvim

# Update the init.lua file with the OSC 52 clipboard provider configuration
RUN printf "\n\
-- force nvim to use 'OSC 52' clipboard provider.\n\
-- this enables \`\"+y\`, \`\"+p\` motions to copy to and paste from system clipboard\n\
-- on nvim running inside docker container. make sure to use terminal that supports OSC 52.\n\
-- read more in the help section \`:h clipboard\`, \`:h clipboard-osc52\`\n\
vim.g.clipboard = {\n\
  name = 'OSC 52',\n\
  copy = {\n\
    ['+'] = require('vim.ui.clipboard.osc52').copy('+'),\n\
    ['*'] = require('vim.ui.clipboard.osc52').copy('*'),\n\
  },\n\
  paste = {\n\
    ['+'] = require('vim.ui.clipboard.osc52').paste('+'),\n\
    ['*'] = require('vim.ui.clipboard.osc52').paste('*'),\n\
  },\n\
}" >> /root/.config/nvim/init.lua

# Set working directory
WORKDIR /workspace

# Start Neovim by default
CMD ["nvim"]
