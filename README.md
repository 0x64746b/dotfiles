# The Best Way to Store Dotfiles

Some of the config files in this home directory are version controlled in a Git
repository that is backuped to [github](https://github.com/0x64746b/dotfiles).

The setup is based on [a post by Nicola Paolucci ](https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/)
which itself documents a [Hacker News thread entry by StreakyCobra](https://news.ycombinator.com/item?id=11070797).

The local files are registered in the `bare` repository in `~/.dotfiles`.

## Checkout

To use this repository on another machine:

```bash
$ cd ~
$ git clone --bare https://github.com/0x64746b/dotfiles.git .dotfiles
$ alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
$ dotfiles config --local status.showUntrackedFiles no
$ dotfiles checkout
```

If the checkout fails due to conflicting existing files, either backup them
manually or discard them with a

```zsh
$ dotfiles checkout --force
```

## Extend/Update

If you want to version another file/have changed a controlled setting, `add`,
`commit` and `push` as in any Git repo:

```zsh
$ dotfiles status
[...]
$ dotfiles diff
[...]
$ dotfiles add <modified_config>
$ dotfiles commit -m 'Set <awesome_setting> in <modified_config>'
[...]
$ dotfiles push --set-upstream origin master
[...]
```

For the `push` to work, you need to have configured your own `remote` with
write access. You might also want to configure a `user.name` and `user.email`
for the repo so your commits look neat.
