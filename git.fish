abbr gfap 'git fetch origin --all --purge'
abbr gtus 'git status'
abbr gs 'git status'
abbr gcm 'git commit -m '
abbr gcam 'git commit -am '
abbr gco 'git checkout'
abbr gdi 'git diff'
abbr gfu 'git commit --amend --no-edit' # fixup
abbr gdev 'git checkout develop && git merge origin/develop'
abbr gfap 'git fetch --all -p --tags'
abbr gta 'HERE `pwd`; for d in */; do cd $d; echo $d; git checkout master; git pull; cd $HERE; done;'
abbr gpo 'git push origin $(git symbolic-ref --short HEAD)'
abbr gpom 'git pull origin master'
abbr gdep 'git fetch --all; git checkout testing && git reset --hard origin/testing && git merge origin/develop && git push origin testing'
abbr latest branches
abbr glb 'git for-each-ref --sort -committerdate refs/heads/ | head'
abbr glast 'git diff-tree --name-only -r --no-commit-id HEAD'

