# Buildit Jenkins on AKS with RBAC

1. Create the AKS cluster:

    ./create-aks-cli.sh

2. Add RBAC for dashboard (optional):

    kubectl apply -f dashboard-rbac.yaml

3.  Deploy Jenkins, passing in your startup secret:

    ./deploy-jenkins.sh \<startup secret\>

4.  Install Helm (Tiller), Nginx-ingress, and kube-lego:

    ./install-ingress-and-kube-lego.sh

5.  Obtain the IP address of your ingress controller (may have to wait a few minutes):

    kubectl get service -l app=nginx-ingress --namespace kube-system

6.  Create a DNS entry for your ingress:

    ./set-fqdn.sh \<IP ADDRESS\> \<DNS PREFIX\>

7.  Edit buildit-jenkins-ingress-aks-https.yaml with your new DNS entries.

8.  Deploy Jenkins ingress:

    kubetl apply -f buildit-jenkins-ingress-aks-https.yaml



