cleanup () {
  docker-compose -p citest down -v
}

docker-compose -p citest pull && docker-compose -p citest up -d

TEST_EXIT_CODE=`docker wait citest_tests_1`

docker logs citest_tests_1

cleanup

exit $TEST_EXIT_CODE
