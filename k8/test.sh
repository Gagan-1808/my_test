aws ec2 create-tags \
	--resources subnet-058c4eb9123a3fed0 \
	--tags	Key=kubernetes.io/role/elb,Value=1 \
	        Key=kubernetes.io/cluster/todo-cluster,Value=shared

