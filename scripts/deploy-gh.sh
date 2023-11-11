#!/usr/bin/env sh

set -e

cd public

echo 'melodot.io' > CNAME

git init

git add -A

git commit -m 'deploy'

git push -f git@github.com:ZeroDAO/melodot.io master:gh-pages

cd -