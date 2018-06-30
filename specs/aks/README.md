# Buildit Jenkins on AKS with RBAC

* Create the AKS cluster:

    ./create-aks-cli.sh

*  Deploy Jenkins, passing in your startup secret:

    ./deploy-jenkins.sh \<startup secret\>

*  Install Helm (Tiller):

    ./install-helm-tiller.sh

*  Wait for tiller pod to become available. Install nginx-ingress and kube-lego:

    ./install-ingress-and-kube-lego.sh

*  Obtain the IP address of your ingress controller (may have to wait a few minutes):

    kubectl get service -l app=nginx-ingress --namespace kube-system -w

*  Create a DNS entry for your ingress.  DNS prefix is fixed in script:

    ./set-fqdn.sh \<IP ADDRESS\>

*  Edit buildit-jenkins-ingress-aks-https.yaml with your new DNS entries.

*  Deploy Jenkins ingress:

    kubectl apply -f buildit-jenkins-ingress-aks-https.yaml



