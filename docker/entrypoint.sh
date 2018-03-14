#!/bin/bash
set -e

if [ "$(id -u)" = '0' ]; then
	chown -R $APP_USER:$APP_USER $APP_PATH
	sync
	exec $APP_PATH/docker/gosu $APP_USER "$BASH_SOURCE" "$@"
fi

FILES_DIR=$APP_PATH/files

mkdir -p $FILES_DIR
chown -R "$(id -u)" "$FILES_DIR" 2>/dev/null || :
exec $1
