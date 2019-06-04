#!/usr/bin/env bash

set -ex

vendor/bin/psalm.phar
vendor/bin/phpunit $PHPUNIT_FLAGS
phpenv config-rm xdebug.ini || true
php tests/benchmark.php json 3
php tests/benchmark.php xml 3
vendor/bin/phpcs
