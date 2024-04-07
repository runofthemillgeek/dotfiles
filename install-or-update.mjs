#!/usr/bin/env zx

await echo(chalk.blue("Syncing tmux settings"))
await $`cp tmux/tmux.conf ~/.tmux.conf`;

await echo(chalk.blue("Syncing git config"))
await $`cp git/.gitconfig ~/.gitconfig`;

await echo(chalk.blue("Syncing gpg config"))
await $`cp gpg/gpg-agent.conf ~/.gnupg/gpg-agent.conf`

