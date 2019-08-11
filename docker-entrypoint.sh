#!/bin/bash

CMD=$1


case "$CMD" in
    "start" )
        if [ ! -d "src" ]; then
            composer global require zendframework/zendframework
            composer create-project zendframework/skeleton-application ./src
            composer global require "squizlabs/php_codesniffer=*"
        fi

        cd src
        composer update
        composer install

        composer require zendframework/zend-db

		echo "Running application on 8080"
        php -S 0.0.0.0:8080 -t public/
        ;;
    * )
        exec $CMD ${@:2}
        ;;
esac
