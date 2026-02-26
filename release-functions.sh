#!/bin/bash

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

prepareChangelog() {
  local sourceFile=$1
  local targetFile=$2
  local notices=$3

  rm -rf changelog-tmp
  mkdir changelog-tmp

  # Remove all "[...]: ..." link declarations (typ. at the bottom of the file)
  sed -e "s/^\[[^\]*\]: http.*//g" $sourceFile > changelog-tmp/CHANGELOG2.md

  # Remove brackets for internal links [...], but not for links with [...](...)
  sed -E 's|\[([^]]+)]([^(])|\1\2|g' changelog-tmp/CHANGELOG2.md > changelog-tmp/CHANGELOG3.md
  sed -E 's|\[([^]]+)]$|\1|g' changelog-tmp/CHANGELOG3.md > changelog-tmp/CHANGELOG4.md

  # Add notices (if any)
  sed "s|# Changelog|# Changelog$notices|g" changelog-tmp/CHANGELOG4.md > $targetFile

  rm -rf changelog-tmp
}

getNexusOutfile() {
  local version=$1
  local groupId=$2
  local artifactId=$3
  local type=$4
  local classifier=$5

  if [ -z "$classifier" ]; then
    echo "$artifactId-$version.$type"
  else
    echo "$artifactId-$version-$classifier.$type"
  fi
}

downloadFromNexus() {
  local version=$1
  local groupId=$2
  local artifactId=$3
  local type=$4
  local classifier=$5
  local outfile
  outfile=$(getNexusOutfile $@)

  local query="http://nexus-bob.u-s-p.local/service/rest/v1/search/assets?sort=version&maven.baseVersion=$version&maven.groupId=$groupId&maven.artifactId=$artifactId&maven.extension=$type&maven.classifier=$classifier"
  echo "Nexus query URL: $query"

  wget -O info.json $query
  downloadUrl=`cat info.json | grep -v '\-sources' | grep -a -m 1 -h "downloadUrl" | grep -Po 'downloadUrl" : "\K[^"]*'`
  echo "Nexus download URL: $downloadUrl"
  rm info.json
  wget -O $outfile $downloadUrl
}

getGitLabOutfile() {
  local version=$1
  local repoPath=$2
  local repoName=$3
  local file=$4
  echo "$repoName-$version-$file"
}

# PROBABLY OBSOLETE / TODO: REMOVE
downloadFromGitLab() {
  local version=$1
  local repoPath=$2
  local repoName=$3
  local file=$4
  local outfile
  outfile=$(getGitLabOutfile $@)

  echo "Clone GIT repo: git@git.u-s-p.local:$repoPath/$repoName.git"
  git clone --depth 1 --branch $version git@git.u-s-p.local:$repoPath/$repoName.git
  cp $repoName/$file $outfile
}

