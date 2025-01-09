#!/usr/bin/env python

"""
Create symlink for all config file.
"""
import os
import subprocess
import logging
import shutil

logging.basicConfig(level=logging.DEBUG)
logger = logging.getLogger(__name__)

src_dst = {
    "bashrc": ".bashrc",
    "cwmrc": ".cwmrc",
    "emacs": ".emacs.d/init.el",
    "hvnalias": ".hvnalias",
    "i3config": ".config/i3/config",
    "git.fish": ".config/fish/conf.d/git.fish",
    "inputrc": ".inputrc",
    "mutt/baserc": ".mutt/baserc",
    "mutt/imaprc": ".mutt/imaprc",
    "mutt/pgprc": ".mutt/pgprc",
    "tmux.conf": ".tmux.conf",
    "vimrc": ".vimrc",
    "xsession": ".xsession",
    "zshrc": ".zshrc",
    "UltiSnips_all.snippets": ".vim/UltiSnips/all.snippets",
    "Xresources": ".Xresources",
}

home = os.path.expanduser("~")

## create for vim
print("Setting up vim plugins")
for d in ["~/.vim/swapfiles", "~/.vim/UltiSnips", "~/.vim/pack/me/start"]:
    try:
        os.makedirs(os.path.expanduser(d))
    except OSError:
        pass
with open(os.path.join(os.path.dirname(__file__), "vim-plugins.txt")) as f:
    vim_plugins = [line for line in f if not line.startswith("#")]

    try:
        cwd = os.getcwd()
        for p in vim_plugins:
            os.chdir(os.path.expanduser("~/.vim/pack/me/start"))
            r = subprocess.run(["git", "clone", "--depth", "1", p.strip()])
            print(r.stdout)
    finally:
        os.chdir(cwd)

for src in src_dst:
    source = os.path.abspath(src)
    dest = os.path.join(home, src_dst[src])
    if os.path.islink(dest):
        if os.lstat(dest):
            try:
                os.stat(dest)
            except OSError:
                # dest is a symlink and it is broken
                logger.info(
                    "Removing broken symlink and create new one %s", dest
                )
                os.remove(dest)
                os.symlink(source, os.path.join(home, dest))
            else:
                if os.path.realpath(dest) != source:
                    logger.info("%s not point to %s", dest, source)
                    shutil.move(dest, ".".join((dest, "backup")))
                    os.symlink(source, os.path.join(home, dest))
                else:
                    logger.info("%s pointed to %s", dest, source)
    else:
        logger.debug("Checking %s", dest)
        try:
            os.stat(dest)
            logger.info(
                "%s is not a symlink, append its name with .backup", dest
            )
            shutil.move(dest, ".".join((dest, "backup")))
        except OSError:
            # should only fail if dest dir not exist due to dir path not exist
            contain_dir = os.path.dirname(dest)
            logger.debug("%s does not exist", dest)

            if not os.path.isdir(contain_dir):
                os.mkdir(contain_dir)
                logger.debug("Created dir %s", contain_dir)
            else:
                logger.debug("%s dir exists", contain_dir)
        logger.info("Creating symlink %s ------> %s", dest, source)
        os.symlink(source, os.path.join(home, dest))

with open(os.path.expanduser("~/.ugly_aliases"), "a") as f:
    here = os.path.dirname(os.path.abspath(__file__))
    f.write("export PATH={}/bin:$PATH".format(here))

