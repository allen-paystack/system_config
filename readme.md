# ZSH Custom Config

This repo demonstrates how to use a custom config file to configure zsh.

Why ZSH (and iTerm 🙈)? OhMyZSH is a good alternative to bash. Find out why [here](https://www.howtogeek.com/362409/what-is-zsh-and-why-should-you-use-it-instead-of-bash/). And find out how to set it up [here](https://www.freecodecamp.org/news/jazz-up-your-zsh-terminal-in-seven-steps-a-visual-guide-e81a8fd59a38/)

It currently loads aliases and variables into shell at startup.

Your Main config file at `~/.zshrc` needs to be updated with the scripts found in `zshrc.sample`.

The file `variables.zshrc.sample` needs to be converted to `variables.zshrc` and then fill in your environment variable values

To generate the file `variables.zshrc` you can run

```shell script
cp variables.zshrc.sample variables.zshrc
```