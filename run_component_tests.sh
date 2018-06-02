cleanup () {
  docker-compose -f docker-compose-tests.yaml -p citest down -v
}

docker-compose -f docker-compose-tests.yaml -p citest build && docker-compose -f docker-compose-tests.yaml -p citest up -d

TEST_EXIT_CODE=`docker wait citest_tests_1`

docker logs citest_tests_1

cleanup

exit $TEST_EXIT_CODE
