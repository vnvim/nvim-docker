# nvim-docker
Use Neovim (NvChad v2.5 distro) from docker container!

## How to run?
- Build image locally using
  ```
  docker build -t nvim-docker .
  ```

- Run the container using
  ```
  docker run -it --name vnvim -v $(pwd):/workspace nvim-docker
  ```

  Here `${pwd}` is the present working directory. If you want you can use explicit path to map it to the `/workspace` directory of the container. The name `vnvim` is assigned to the container. We can use this name with docker commands for performing operations on this container.

- When you quit neovim using `:q` etc commands, the container will stop.

- Restart neovim from same container using
  ```
  docker start -ai vnvim
  ```
  
