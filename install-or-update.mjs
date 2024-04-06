#!/usr/bin/env zx

await echo(chalk.blue("Syncing tmux settings"))
await $`cp tmux/tmux.conf ~/.tmux.conf`;
