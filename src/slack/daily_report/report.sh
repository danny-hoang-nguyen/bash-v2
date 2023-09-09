#!/bin/bash
base_path="/Users/dannynguyen/Desktop/bash/src/slack/daily_report"
input="$base_path/info"
template="$base_path/template.json"

while read -r id stage summary; do
  echo "$id, $stage, $summary"
  payload=$(cat $template | sed "s/ID/$id/g" | sed "s/report-block-id/$(date +%s000)/g" | sed "s/SUMMARY/$summary/g")
  case $stage in

  0)
    payload=${payload//PR created(0)/:fire: _*PR created(0)*_ }
    ;;
  1)
    payload=${payload//verify DEV(1)/:fire: _*verify DEV(1)*_ }
    ;;
  2)
    payload=${payload//UT(2)/:fire: _*UT(2)*_ }
    ;;
  3)
    payload=${payload//PR created(3)/:fire: _*PR created(3)*_ }
    ;;
  4)
    payload=${payload//PR approved(4)/:fire: _*PR approved(4)*_ }
    ;;
  5)
    payload=${payload//verify QA(5)/:fire: _*verify QA(5)*_ }
    ;;
  6)
    payload=${payload//Ready for QA(6)/:fire: _*Ready for QA(6)*_ }
    ;;
  *)
    echo "Unknown stage"
    ;;
  esac

done <"$input"
echo "==========================="
echo "request payload: $payload"

res=$(curl --location -s 'https://slack.com/api/chat.postMessage' \
  --header 'Content-type: application/json' \
  --header "Authorization: Bearer $SLACK_BOT_TOKEN" \
  --data-raw "$payload" | json_pp)
echo "==========================="
echo "request response: $res"
