#!/bin/bash

# JSON object to pass to Lambda Function
json={"\"name\"":"\"Fred\u0020Smith\",\"param1\"":1,\"param2\"":2,\"param3\"":3}

echo "Invoking Lambda function using API Gateway"
#time output=`curl -s -H "Content-Type: application/json" -X POST -d  $json {APIGATEWAY FUNCTION URL}`

#echo ""
#echo "CURL RESULT:"
#echo $output | jq
#echo ""
#echo ""

echo "Invoking Lambda function using AWS CLI"
time output=`aws lambda invoke --invocation-type RequestResponse --function-name hello_sqlite --region us-east-2 --payload $json /dev/stdout | head -n 1 | head -c -2 ; echo` 
#time output=`aws lambda invoke --invocation-type RequestResponse --function-name {FUNCTION NAME} --region us-east-2 --payload $json /dev/stdout | head -n 1 | head -c -2 ; echo` 
echo ""
echo "AWS CLI RESULT:"
echo $output | jq
echo ""







