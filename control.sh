#!/bin/bash

ENABLED_MODULES="
                 -f docker-compose-bitcoin.yml
                 "

#                 -f docker-compose-btc.yml
#                 -f docker-compose-ltc.yml
#                 -f docker-compose-dash.yml
#                 -f docker-compose-btg.yml
#                 -f docker-compose-zec.yml
#                 -f docker-compose-eth.yml
#                 -f docker-compose-bch.yml


docker-compose $ENABLED_MODULES "$@"

