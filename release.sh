#!/bin/bash

set -eE # same as: `set -o errexit -o errtrace`
trap 'catch $? $LINENO' ERR

catch() {
  echo "Error $1 occurred on line $2"
}

checkbin() {
  local cmd=$1
  if ! command -v $cmd &> /dev/null; then
    echo "$cmd command could not be found"
    echo "HINT: If you are using a python virtual environment then you need to active it before running this script"
    echo "possibly with this command or a similar one (depending on how you created your venv):"
    echo "$ source ~/.venv/bin/activate"
    exit
  fi
}

DIR=`pwd`
rm -rf build
rm -rf docs
rm -rf generated
mkdir build
cd build

# =====================================================================
# Begin site build
# =====================================================================

# Prepare site source directory
cd $DIR

# Copy base markdown files from sources
cp -R src/docs docs

echo "Successfully generated site (Markdown) in docs folder."

[ "$1" == "deploy" ] && DEPLOY=true && shift

if [ $DEPLOY ]; then
    echo "Deploying to GitHub pages..."
    mkdocs gh-deploy --force --ignore-version

    # Now merge branches together
    rm -rf build
    mkdir -p build
    cd build
    git clone git@github.com:united-security-providers/usp-aero.git -b gh-pages-top
    cd usp-aero
    git checkout gh-pages
    git merge -m 'merging top into gh-pages' --allow-unrelated-histories gh-pages-top
    rm -rf pagefind/
    python3 -m pagefind --site .
    git add pagefind/
    git commit --allow-empty -m 'Adding pagefind data' .
    git push -f
    cd -
    echo "Successfully deployed to to GitHub pages"
else
    echo "Building website locally in 'generated' subfolder..."
    mkdocs build
    echo "Website generated."
fi

trap - ERR
