#!/bin/bash

extract_slack_url() {
  export INPUT=$1
  export FIND_WHICH=$2

  if [ "x$INPUT" == "x" ]; then
    export INPUT='https://leapxpert.slack.com/archives/C02QLSAPFRC/p1676126989877209'
  fi

  export CHANNEL=$(echo $INPUT | cut -d'/' -f 5)
  export THREAD_TS=$(echo $INPUT | cut -d'/' -f 6)

  export FIRST=$(echo $THREAD_TS | cut -c 2-11)
  export SECOND=$(echo $THREAD_TS | cut -c 12-17)
  export PROCESSED_THREAD_TS=$FIRST.$SECOND

  if [ "$FIND_WHICH" == "CHANNEL" ]; then
    echo "channel id is: "$CHANNEL
  else
    echo "msg id is: "$PROCESSED_THREAD_TS
  fi
}


extract_slack_url "$@"