#!/usr/bin/env bats

setup() {
  # executed before each test
  load 'test_helper/bats-support/load'
  load 'test_helper/bats-assert/load'

  # get the containing directory of this file
  # use $BATS_TEST_FILENAME instead of ${BASH_SOURCE[0]} or $0,
  # as those will point to the bats executable's location or the preprocessed file respectively
  DIR="$(cd "$(dirname "$BATS_TEST_FILENAME")" >/dev/null 2>&1 && pwd)"
  # make executables in src/ visible to PATH
  PATH="$DIR/../src:$PATH"
  echo "setup" >&3
}

teardown() {
  # executed after each test
  echo "teardown" >&3
}

@test "test_get_pods" {
  run sh get_pods.sh
  assert_output --partial 'NAMESPACE'
  assert_output --partial 'NAME'
  assert_output --partial 'STATUS'
}

@test "test_get_namespaces" {
  run sh ns.sh
  assert_output --partial 'default'
  assert_output --partial 'NAME'
  assert_output --partial 'STATUS'
  assert_output --partial 'AGE'
}

@test "test_get_contexts" {
  run sh ctx.sh
  assert_output --partial 'default'
  assert_output --partial 'NAME'
  assert_output --partial 'CLUSTER'
  assert_output --partial 'AUTHINFO'
}
