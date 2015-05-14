#!/bin/bash
mkdir -p ~/.vim/{autoload, bundle}
python2 -c "import urllib, os;\
    print urllib.urlretrieve('https://raw.githubusercontent.com/tpope/vim-pathogen/master/autoload/pathogen.vim', \
    os.path.join(os.path.expanduser('~'), '.vim', 'autoload', 'pathogen.vim'))"
