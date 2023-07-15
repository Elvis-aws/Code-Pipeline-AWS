import boto3
import cfnresponse
import os

account_id = os.environ['ACCOUNT_ID']
ecr_repository_name = os.environ['ECR_REPOSITORY_NAME']

ecr_client = boto3.client('ecr')

DELETE = 'Delete'
response_data = {}


def lambda_handler(event, context):
    try:
        if event['RequestType'] == DELETE:
            list_images_response = ecr_client.list_images(
                registryId=account_id,
                repositoryName=ecr_repository_name
            )
            print(list_images_response)

            image_ids = list_images_response['imageIds']

            if len(image_ids) == 0:
                cfnresponse.send(event, context, cfnresponse.SUCCESS, response_data)
                return

            batch_delete_image_response = ecr_client.batch_delete_image(
                registryId=account_id,
                repositoryName=ecr_repository_name,
                imageIds=image_ids
            )
            print(batch_delete_image_response)

        cfnresponse.send(event, context, cfnresponse.SUCCESS, response_data)

    except Exception as e:
        print(e)
        cfnresponse.send(event, context, cfnresponse.FAILED, response_data)
