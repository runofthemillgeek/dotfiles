#!/usr/bin/env zx

await echo(chalk.blue("Syncing tmux settings"))
await $`cp tmux/tmux.conf ~/.tmux.conf`;

await echo(chalk.blue("Syncing git config"))
await $`cp git/.gitconfig ~/.gitconfig`;

await echo(chalk.blue("Syncing gpg config"))
await $`cp gpg/gpg-agent.conf ~/.gnupg/gpg-agent.conf`

await echo(chalk.blue("Syncing zsh config"))
await $`rsync -ahP zsh/ ~/`

await echo(chalk.red("Replacing oh-my-zsh source with custom source"))
let zshrc = await fs.readFile(path.resolve($.env.HOME, ".zshrc"), "utf-8")
zshrc = zshrc.replace("source $ZSH/oh-my-zsh.sh", "source .custom/.zshrc")
await fs.writeFile(path.resolve($.env.HOME, ".zshrc"), zshrc, "utf-8")

await echo(chalk.green("Completed! 🚀"))

