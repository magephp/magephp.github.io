#!/bin/bash
VERSION=$1
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

cd $DIR/../download &>/dev/null

wget "https://github.com/magephp/magallanes/archive/$VERSION.tar.gz" -q -O magallanes.$VERSION.tar.gz

MIN_VERSION=${VERSION:1}
mv magallanes.$VERSION.tar.gz magallanes.$MIN_VERSION.tar.gz &>/dev/null

echo "$VERSION has been downloaded successfully..."
