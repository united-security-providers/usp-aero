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
    echo "$ source .venv/bin/activate"
    exit
  fi
}

if [ "$#" -lt 1 ]
then
  echo "Not enough arguments supplied. Usage:"
  echo ""
  echo "./release.sh <helm-chart-version, e.g. 1.0.0> [deploy] [--latest] "
  echo ""
  echo "If the optional 'deploy' argument is set, the website will be deployed to Github and made public!"
  echo "If the optional 'latest' flag is set, then the specified version will become the latest version"
  echo ""
  echo "Example for creating the website without deployment:"
  echo ""
  echo "./release.sh 1.0.0"
  exit 1
fi


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
[ "$1" == "--latest" ] && RELEASE_ALIAS=latest && shift

if [ $DEPLOY ]; then
    echo "Deploying to GitHub pages..."
    version=$(echo "$CHARTS_VERSION" | sed -E 's/^v?([0-9]+)\.([0-9]+)\.[0-9]+$/\1.\2.x/')
    mkdocs gh-deploy --force
    echo "Successfully deployed to to GitHub pages"
else
    echo "Building website locally in 'generated' subfolder..."
    mkdocs build
    echo "Website generated."
fi

if [[ $DEPLOY && "${RELEASE_ALIAS}" == "latest" ]]; then
    echo "Setting default latest..."
    mike set-default --push --allow-empty "${RELEASE_ALIAS}"
    echo "Set default latest."
fi

trap - ERR
