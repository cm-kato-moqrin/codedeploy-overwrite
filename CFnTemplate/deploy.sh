#!/bin/bash

source envfile

TEMPLATE=demo.template

TEMPLATE_NAME=${TEMPLATE}.yml
STACK_NAME=${NameTagPrefix}-codedeploy-stack

# テンプレートの実行
aws cloudformation deploy --stack-name ${STACK_NAME} --template-file ${TEMPLATE_NAME} \
  --parameter-overrides \
  NameTagPrefix=${NameTagPrefix} \
  KeyName=${KeyName} \
  AMIID=${AMIID} \
  GitHubRepositoryName=${GitHubRepositoryName} \
  GitHubAccountName=${GitHubAccountName} \
  GitHubSecret=${GitHubSecret} \
  Branch=${Branch} \
  ApplicationName=${ApplicationName} \
  DeploymentGroupName=${DeploymentGroupName} \
  PipelineName=${PipelineName} \
  --capabilities CAPABILITY_NAMED_IAM

exit 0
