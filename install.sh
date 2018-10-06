  
  # install Kubernetes
  # 
  kubeadm init --apiserver-advertise-address=172.16.0.22  --pod-network-cidr=192.168.0.0/16
  cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
  kubectl apply -f "https://cloud.weave.works/k8s/net?k8s-version=$(kubectl version | base64 | tr -d '\n')"
  watch -n 2 kubectl get pods --all-namespaces -o wide
  kubectl get nodes
  591  kubectl apply -f https://docs.projectcalico.org/v3.0/getting-started/kubernetes/installation/hosted/kubeadm/1.7/calico.yaml
  592  watch -n 2 kubectl get pods --all-namespaces -o wide
  593  kubectl apply -f https://docs.projectcalico.org/v3.0/getting-started/kubernetes/installation/hosted/calicoctl.yaml
  594  watch -n 2 kubectl get pods --all-namespaces -o wide
  595  kubectl exec -ti -n kube-system calicoctl -- /calicoctl get profiles -o wide
  596  kubectl create deployment nginx --image=nginx
  597  watch -n 2 kubectl get pods --all-namespaces -o wide
  598  kubectl create service nodeport nginx --tcp=80:80
  599  kubectl get svc
  600  watch -n 2 kubectl get pods --all-namespaces -o wide
  601  curl worker1.variasimx.com:31750
  605  kubectl delete service nginx
  606  curl worker1.variasimx.com:31750
  607  kubectl get svc
  610  kubectl create service clusterip  nginx --tcp=80:80
  611  kubectl get svc
  612  curl 10.106.161.83
  613  watch -n 2 kubectl get pods --all-namespaces -o wide
  614  kubectl apply -f install/kubernetes/istio-demo-auth.yaml
  615  watch -n  kubectl get pods --all-namespaces -o wide
  616  watch -n2 kubectl get svc -n istio-system
  618  kubectl get svc -n istio-system
kubectl get pods -n istio-system
