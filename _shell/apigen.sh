#!/bin/bash
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
SOURCE="$DIR/../_vendor/magephp/magallanes/Mage"

mkdir $DIR/../api &>/dev/null

DESTINATION="$DIR/../api"

php _mage-api/apigen.phar generate -s $SOURCE -d $DESTINATION --title="Magallanes API Documentation"
