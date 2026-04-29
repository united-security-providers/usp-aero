# How To Deploy

## Overview

Deploying this website, or parts of it, is a bit more complicated than usual because there are multiple sites nested into each other:

* usp-aero - The top landing website
* usp-aero/aero-platform - The Aero platform website
* usp-aero/aero-waap - The Aero WAAP website

Because the top site uses plain mkdocs, it needs to generate its website into a custom GIT branch instead of the usual "gh-pages", because it would delete all the content from the sub-websites in "gh-pages" every time. So the GIT branch setup for the deployment works like this:

* usp-aero - builds the site into GIT branch "gh-pages-top"
* aero-platform - builds the site into GIT branch "gh-pages", in a version-specific subdirectory (using the "mike" mkdocs extension)
* aero-waap - same as aero-platform

Once this is done, the top "deploy.sh" script will first build the top-level site "usp-aero" into its custom branch, and then merge that custom branch into the "gh-pages" branch, and then pushes that branch. 

## Changing the top-level site

Changes in the top-level site just require to run the top-level "deploy.sh" script, which does not take any version parameters:

    $ ./release.sh deploy

## Changing the sub-sites

Changes in a sub-site like "aero-platform" require to run the "release.sh" script in that subfolder, with the required parameters, e.g.

    $ cd aero-platform
    $ ./release.sh 1.5.0 deploy --latest

# Fixing Things

When something goes wrong, it is always possible to check out the "gh-pages" branch where the generated static content is stored, and fix it manually. Like deleting a version of one of the subsites by removing the directory etc.