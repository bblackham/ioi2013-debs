#!/bin/bash

set -xe

# Do stuff locally on smp-ioi03.
if [ "$HOSTNAME" = "smp-ioi03" ] ; then
	REMOTE=()
else
	REMOTE=(ssh -t smp-ioi03)
fi

# Upload and publish deb files to ioi2013 repository.

tar cz "$@" | "${REMOTE[@]}" /home/tc/bin/add-debs-from-tarball

# Sign the updated repository. Do this separately because we need our stdin
# tty.
# Ask Bernard for the gpg password.
"${REMOTE[@]}" /home/tc/bin/sign-repo
