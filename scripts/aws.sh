#!/bin/bash

if [ $# -eq 0 ]; then
    echo "No parameter provided. Please provide a function name."
    exit 1
fi

CACHE_DIR=~/.init/cache/${AWS_PROFILE}
CACHE_SSM="$CACHE_DIR/aws_ssm.cache"
CACHE_SQS="$CACHE_DIR/aws_sqs.cache"

aws_login() {
  opts=`echo "Dev Sandbox Stage Prod" | tr ' ' '\n'`
  app_env=`printf "$opts" | fzf-tmux -p -w 20% -h 20% | tr '[:upper:]' '[:lower:]'`

  AWS_PROFILE=$app_env
  AWS_REGION=us-east-1

  TMUX_WINDOW_NAME="AWS ${AWS_PROFILE}"

  tmux new-window -n "$TMUX_WINDOW_NAME"
  tmux send-keys -t "$TMUX_WINDOW_NAME" "export AWS_PROFILE=$AWS_PROFILE;export AWS_REGION=$AWS_REGION" C-m
  tmux send-keys -t "$TMUX_WINDOW_NAME" "aws sso login" C-m
  tmux send-keys -t "$TMUX_WINDOW_NAME" "clear" C-m
}

aws_cache() {
  if [ -z "$AWS_PROFILE" ]; then
    echo "AWS_PROFILE is not defined"
    exit 1
  fi

  if [ ! -d  "$CACHE_DIR" ]; then
    mkdir -p  $CACHE_DIR
  fi

  aws ssm get-parameters-by-path --path "/" --recursive --query "Parameters[*].[Name]" --output text > $CACHE_SSM
  aws sqs list-queues --query 'QueueUrls[*] | join(`\n`, @)' --output text > $CACHE_SQS
}

aws_sqs_list_queues() {
  if [ -z "$AWS_PROFILE" ]; then
    echo "AWS_PROFILE is not defined"
    exit 1
  fi

  QUEUE_URL="$(cat $CACHE_SQS | fzf)"
  aws sqs get-queue-attributes --queue-url $QUEUE_URL --attribute-names All --query "Attributes" | jq
}

aws_ssm_show_secret() {
  if [ -z "$AWS_PROFILE" ]; then
    echo "AWS_PROFILE is not defined"
    exit 1
  fi

  NAME="$(cat $CACHE_SSM | fzf)"
  aws ssm get-parameters --name "$NAME"  --with-decryption | jq ".Parameters[] | .Value"
}

aws_ecs_deploy_status() {
  if [ -z $1 ]; then
    echo "Usage: iaws deploy-status <Service-Name>"
    exit 1
  fi

  SERVICE_NAME=$1
  watch -n 1 "aws ecs describe-tasks --tasks $(aws ecs list-tasks --service-name $SERVICE_NAME --query 'taskArns' --output text) | jq '.tasks[] | {taskDefinitionArn, lastStatus, createdAt}'"
}

function aws_command() {
  case $1 in
    "login")
      aws_login "$2" ;;
    "cache")
      aws_cache ;;
    "list-queues")
      aws_sqs_list_queues ;;
    "ssm-show-secret")
      aws_ssm_show_secret ;;
    "deploy-status")
      aws_ecs_deploy_status "$2" ;;
    *)
      echo "Function not recognized." ;;
  esac
}
