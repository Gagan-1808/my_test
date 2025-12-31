aws ec2 create-tags \
	--resources subnet-0a8b34dca25cc6cca subnet-00a52f7a70f1d38a1 \
	--tags	Key=kubernetes.io/role/elb,Value=1 \
	        Key=kubernetes.io/cluster/todo-cluster,Value=shared

