#!/bin/bash

tag="$(git tag -l --sort=-v:refname | head -n1)"

test "$tag" || exit 1
[ "$(git log -n1 | head -n1)" != "$(git log -n1 "$tag" | head -n1)" ] || exit 1
git verify-tag "$tag" || exit 1
exec git checkout "$tag"
