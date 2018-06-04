#!/bin/bash
SERVICE=dukedoms_mock_card_service
docker build --build-arg service=$SERVICE \
--tag "mhhoban/dukedoms-mock-card-service:candidate" .
