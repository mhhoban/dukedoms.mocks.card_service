#!/bin/bash

python setup.py sdist

mock_card_service_sdist='dukedomsmockscardservice-0.0.0.tar.gz'

docker build --build-arg mock_service_sdist=$mock_card_service_sdist \
--tag 'mhhoban/dukedoms_mock_card_service:latest' .
