<!-- vim: set tw=80: -->

# Configuration Files

This is my dot files repository. It is based on the idea of having a git bare
repository with the work tree set to your HOME directory. With this setup no
symlinks are needed nor external tools.

This procedure is described in this [post](https://www.atlassian.com/git/tutorials/dotfiles).

## Instalation

It can be installed straight from the terminal:

```shell
curl -fsSL https://raw.githubusercontent.com/fabiojmendes/cfg/refs/heads/master/.local/share/cfg/bootstrap.sh
```

After installation, you can update it using `cfg update`.
