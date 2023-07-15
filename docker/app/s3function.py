import boto3
import cfnresponse
import os

bucket_name = os.environ['BUCKET_NAME']

s3_client = boto3.client('s3')

DELETE = 'Delete'
response_data = {}

s3_contents_key = 'Contents'


def lambda_handler(event, context):
    try:
        if event['RequestType'] == DELETE:
            list_response = s3_client.list_objects_v2(
                Bucket=bucket_name)
            print(list_response)

            if s3_contents_key not in list_response or (
                    len(list_response[s3_contents_key])) == 0:
                cfnresponse.send(event, context, cfnresponse.SUCCESS, response_data)
                return

            for obj in list_response[s3_contents_key]:
                delete_response = s3_client.delete_object(
                    Bucket=bucket_name,
                    Key=obj['Key'])
                print(delete_response)

        cfnresponse.send(event, context, cfnresponse.SUCCESS, response_data)

    except Exception as e:
        print(e)
        cfnresponse.send(event, context, cfnresponse.FAILED, response_data)