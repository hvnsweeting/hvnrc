#!/usr/bin/env python

'''
Create symlink for all config file.
'''
import os
import logging
import shutil
import sys

if sys.version_info.major != 2 or sys.version_info.minor != 7:
    sys.exit('Require python 2.7 to run')

logging.basicConfig(level=logging.DEBUG)
logger = logging.getLogger(__name__)

src_dst = {'vimrc': '.vimrc',
    'bashrc': '.bashrc',
    'hvnalias': '.hvnalias',
    'tmux.conf': '.tmux.conf',
    'inputrc': '.inputrc',
    'py2req.txt': '.py2req.txt',
    'i3config': '.i3/config',
    'mutt/imaprc': '.mutt/imaprc',
    'mutt/baserc': '.mutt/baserc',
    'mutt/pgprc': '.mutt/pgprc',
    }

home = os.path.expanduser('~')

for src in src_dst:
    source = os.path.abspath(src)
    dest = os.path.join(home, src_dst[src])
    if os.path.islink(dest):
        if os.lstat(dest):
            try:
                os.stat(dest)
            except OSError:
                # dest is a symlink and it is broken
                logger.info('Removing broken symlink and create new one %s',
                            dest)
                os.remove(dest)
                os.symlink(source, os.path.join(home, dest))
            else:
                if os.path.realpath(dest) != source:
                    logger.info('%s not point to %s', dest, source)
                    shutil.move(dest, '.'.join((dest, 'backup')))
                    os.symlink(source, os.path.join(home, dest))
                else:
                    logger.info('%s pointed to %s', dest, source)
    else:
        logger.debug('Checking %s' , dest)
        try:
            os.stat(dest)
            logger.info('%s is not a symlink, append its name with .backup', dest)
            shutil.move(dest, '.'.join((dest, 'backup')))
        except OSError:
            # should only fail if dest dir not exist due to dir path not exist
            contain_dir = os.path.dirname(dest)
            logger.debug("%s does not exist", dest)

            if not os.path.isdir(contain_dir):
                os.mkdir(contain_dir)
                logger.debug("Created dir %s", contain_dir)
            else:
                logger.debug("%s dir exists", contain_dir)
        logger.info('Creating symlink %s ------> %s', dest, source)
        os.symlink(source, os.path.join(home, dest))
