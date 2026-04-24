#!/bin/bash

. ../release-functions.sh

set -eE # same as: `set -o errexit -o errtrace`
trap 'catch $? $LINENO' ERR

checkbin mkdocs
checkbin mike
checkbin wget

if [ "$#" -lt 1 ]
then
  echo "Not enough arguments supplied. Usage:"
  echo ""
  echo "./release.sh <aero-waap-version, e.g. 1.0.0> [deploy] [--latest] "
  echo ""
  echo "If the optional 'deploy' argument is set, the website will be deployed to Github and made public!"
  echo "If the optional 'latest' flag is set, then the specified version will become the latest version"
  echo ""
  echo "Example for creating the website without deployment:"
  echo ""
  echo "./release.sh 1.0.0"
  exit 1
fi

# 1st input parameter = Aero WAAP version
export AERO_WAAP_VERSION=$1

DIR=`pwd`
rm -rf build
rm -rf docs
rm -rf generated
mkdir build
cd build

echo "-------------------------------------------------------------"
echo "- Aero WAAP release: $AERO_WAAP_VERSION"
echo "-------------------------------------------------------------"

# =====================================================================
# Begin site build
# =====================================================================

# Prepare site source directory
cd $DIR

# Copy base markdown files from sources
cp -R src/docs docs

ALPHA_NOTICE="\n\n_This component\/feature is in still active development (\"alpha\"); it is not recommended to already use it in productive environments._"
MIGRATION_NOTICE="\n\nBreaking changes/additions may require to adapt existing configurations when updating, see [Migration Guide](upgrade.md)."

############prepareChangelog build/$CHARTS_CHANGELOG docs/helm-CHANGELOG.md "$MIGRATION_NOTICE"

mkdir -p docs/files

echo "Successfully generated site (Markdown) in docs folder."

[ "$2" == "deploy" ] && DEPLOY=true && shift
[ "$2" == "--latest" ] && RELEASE_ALIAS=latest && shift

if [ $DEPLOY ]; then
    echo "Deploying to GitHub pages..."
    version=$(echo "$AERO_WAAP_VERSION" | sed -E 's/^v?([0-9]+)\.([0-9]+)\.[0-9]+$/\1.\2.x/')
    mike deploy --update-aliases --push "${version}" $RELEASE_ALIAS
    echo "Successfully deployed to to GitHub pages"
else
    echo "Building website locally in 'generated' subfolder..."
    mkdocs build
    echo "Website generated."
fi

if [[ $DEPLOY && "${RELEASE_ALIAS}" == "latest" ]]; then
    echo "Setting default latest..."
    sleep 60
    mike set-default --push --allow-empty "${RELEASE_ALIAS}"
    echo "Set default latest."
fi

trap - ERR
