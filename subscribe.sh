TOPIC='arn:aws:sns:us-west-2:325276749788:YouTubeLiveStartReminders'
REGION='us-west-2'
PHONE=$1

if [ $# -ne 1 ]
then
  echo "Usage: ./sendReminder <"Phone number">"
  exit 1
fi

aws sns subscribe --region $REGION --topic-arn $TOPIC --protocol sms --notification-endpoint "$PHONE"
