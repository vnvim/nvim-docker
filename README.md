# nvim-docker
Use Neovim from docker container!

## How to run?
- Build image locally using
  ```
  docker build -t nvim-docker
  ```

- Run the container using
  ```
  docker run -it --name vnvim -v $(pwd):/workspace nvim-docker
  ```

- When you quit neovim using `:q` etc commands, the container will stop.

- Restart neovim from same container using
  ```
  docker start -ai vnvim
  ```
