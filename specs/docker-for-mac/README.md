# Buildit Jenkins on Docker for Mac (Kubernetes)

## Prerequisites
* Install and configure Docker for Mac with Kubernetes.  This is a good start: https://rominirani.com/tutorial-getting-started-with-kubernetes-with-docker-on-mac-7f58467203fd
* Have a 'Jenkins config' repo ready.  Here is mine for reference: https://github.com/timwebster9/jenkins-config
* update 'JENKINS_CONFIG_FILE' in buildit-jenkins-loadbalancer.yaml with your own config repo URL, if desired.
* add a Kubernetes secret for your Bulidit Jenkins encryption key manually, with name 'jenkins-startup-secret' and key 'JENKINS_STARTUP_SECRET'

## Jenkins Deployment
Apply the configuration:

    kubectl apply -f buildit-jenkins-loadbalancer.yaml

The Jenkins Kubernetes plugin configuration uses internal DNS names, since Jenkins is running inside the cluster:

````
    cloudName = "kubernetes",
    serverUrl = 'https://kubernetes.default.svc',
    namespace = 'default',
    jenkinsUrl = 'http://jenkins-lb.default'
````

Cluster credentials/certificate config seems to be unnecessary.

## Load Balancer
This configuration uses a LoadBalancer service, which will expose ports on your host.  Currently this is port 80 (Jenkins UI) and 5000 (JNLP).

Note the Jenkins URL is the DNS name of the load balancer service.

## Testing
Run the 'hello-k8s' job.  It should work if everything is set up correctly.