# https://dnaeon.github.io/install-and-configure-k8s-on-arch-linux/

# https://ostechnix.com/configure-static-dynamic-ip-address-arch-linux/
# https://en.wikibooks.org/wiki/Linux_Networking/Configuring_a_network_interface

# ubuntu
# https://www.youtube.com/watch?v=UWg3ORRRF60
# https://www.edureka.co/blog/install-kubernetes-on-ubuntu

# https://kubernetes.io/docs/concepts/workloads/controllers/replicaset/

# chmod +x install_kube_packages.sh
# ./install_kube_packages.sh

#or
sudo pacman -S kubeadm kubectl kubelet

kubelet --version
kubectl version
kubeadm version

# Finally, we will install a few additional packages required by kubeadm, which are used as part of the bootstrap process.
sudo pacman -S ethtool ebtables socat conntrack-tools

# Load Balancer setup
sudo pacman -S haproxy
sudo nano /etc/haproxy/haproxy.cfg
sudo systemctl enable haproxy
sudo systemctl start haproxy

# Make sure that kubelet service is enabled.
sudo systemctl enable kubelet

sudo kubeadm init --pod-network-cidr=192.168.0.0/16 --control-plane-endpoint <k8s>:6443 --upload-certs
sudo kubeadm init --pod-network-cidr=192.168.0.0/16 --control-plane-endpoint "127.0.0.1:8000"

deb https://apt.kubernetes.io/ kubernetes-xenial main



