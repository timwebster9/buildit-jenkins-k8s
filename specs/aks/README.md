# Buildit Jenkins on AKS with RBAC

1. Create the AKS cluster:

    ./create-aks-cli.sh

2. Add RBAC for dashboard (optional):

    kubectl apply -f dashboard-rbac.yaml

3.  Deploy Jenkins, passing in your startup secret:

    ./deploy-jenkins.sh \<startup secret\>

4.  Install Helm (Tiller):

    ./install-helm-tiller.sh

5.  Wait for tiller pod to become available. Install nginx-ingress and kube-lego:

    ./install-ingress-and-kube-lego.sh

6.  Obtain the IP address of your ingress controller (may have to wait a few minutes):

    kubectl get service -l app=nginx-ingress --namespace kube-system -w

7.  Create a DNS entry for your ingress.  DNS prefix is fixed in script:

    ./set-fqdn.sh \<IP ADDRESS\>

8.  Edit buildit-jenkins-ingress-aks-https.yaml with your new DNS entries.

9.  Deploy Jenkins ingress:

    kubectl apply -f buildit-jenkins-ingress-aks-https.yaml



