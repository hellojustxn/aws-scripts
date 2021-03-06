#!/bin/bash
# Publish a message to SQS which then sends a SMS notifcation to all subscribers.

if [ $# -ne 1 ]
then
  echo "Usage: ./sendReminder <"Message">"
  exit 1
fi

SECONDS='5'
echo "Sending message in $SECONDS seconds."

for i in $(seq $SECONDS 1)
do
  sleep 1
  echo "$i"
done

# Strange bug, seconds does not get updated
# while [ $SECONDS -gt 0 ]; do
# #  sleep 1
#   echo -ne "$SECONDS"
#   sleep 1
#   : $((SECONDS--))
# done

TOPIC='arn:aws:sns:us-west-2:325276749788:YouTubeLiveStartReminders'
REGION='us-west-2'
PHONE=$2

# if [ '${PHONE:0:1}' = '+' ]
# then
#   echo "Please include a country code."
#   exit 1
# fi

checkStatus() {
  if [ $? -eq 0 ]
  then
    echo "Message successfully published."
  else
    echo "Message failed to publish."
  fi
}

# aws sns subscribe --region $REGION --topic-arn $TOPIC --protocol sms --notification-endpoint "$PHONE"
aws sns publish --region $REGION --topic-arn $TOPIC --message "$1"
checkStatus
exit $?