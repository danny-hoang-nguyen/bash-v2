#!/usr/bin/env bats

setup() {
  # executed before each test
  load 'test_helper/bats-support/load'
  load 'test_helper/bats-assert/load'
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
