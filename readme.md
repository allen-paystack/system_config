# ZSH Custom Config

This repo demonstrates how to use a custom config file to configure zsh.

It currently loads aliases and variables into shell at startup.

Your Main config file at `~/.zshrc` needs to be updated with the scripts found in `zshrc.sample`.

The file `variables.zshrc.sample` needs to be converted to `variables.zshrc` and then fill in your environment variable values

To generate the file `variables.zshrc` you can run

```shell script
cp variables.zshrc.sample variables.zshrc
```