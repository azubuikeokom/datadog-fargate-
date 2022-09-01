register:
	aws ecs register-task-definition --cli-input-json file://./redis-datadog.json --region us-east-1  --profile udacity3 
	aws ecs create-cluster --cluster-name "fargate-test" --profile udacity3

aws ecs run-task --cluster fargate-test \
--network-configuration "awsvpcConfiguration={subnets=["subnet-09bbb470104e4d995","subnet-031522ee818dab936"],securityGroups=["sg-05bce3842dc7366e3"]}" \
--task-definition arn:aws:ecs:us-east-1:782658599825:task-definition/redis-datadog:10 \
--region us-east-1 --launch-type FARGATE --platform-version 1.4.0 



Within the cluster, click the Services tab, then click the Service Name.
Click the Update button.
For the Task Definition, choose the latest Revision from the drop-down menu.
Click the Next step button 3 times, then click the Update Service button.


process
---------------
push images to ecr repo
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 782658599825.dkr.ecr.us-east-1.amazonaws.com
docker pull <image_name>
docker tag <image_name> :tag 782658599825.dkr.ecr.us-east-1.amazonaws.com/image_name:latest
docker push 782658599825.dkr.ecr.us-east-1.amazonaws.com/<image>:tag


docker login -u AWS -p $(aws ecr get-login-password --region us-east-1) 072056452537.dkr.ecr.us-east-1.amazonaws.com