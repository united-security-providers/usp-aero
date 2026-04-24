# Creating Release Notes

When the website for a new Aero platform release is published, the release notes must be prepared manually. The file
that needs to be updated is this one:

----
    src/docs/aero-platform-releasenotes.md
----

The new information is always inserted at the top of the file, right after the main
title "Aero platform Release Notes".

- Create a new level-2 heading for the new version, with release date field, e.g.

----
    ## 1.2.3 - 2026-07-25
----

- Copy the "Contents" section from the last release and update it accordingly (update the 
  version numbers, add newly introduced components and remove obsolete ones).
- Then add the changelog entries from the various changelog of the Aero platform proxy
  and components into the sections as defined in the last release (or the template file
  to be found in the project root).
- In each release entry category (such as "New features and improvements) add all the
  changelogs from the Aero platform proxy first, e.g. support for a new filter technology
  or monitoring integration etc.
- Following these entries, add the changelog entries from all sub-components, such as
  each filter, the operator, the helm chart etc.
- For each sub-component, add a bold prefix to the changelog entry copied from the
  component changelog.

