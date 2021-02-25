# Notes 
Using local registry and IP address. Generaly it should be DNS reachable from k8s. 

1. Allow docker deamon nodes to fetch images from not secure registry via HTTP

/etc/docker/daemon.json
```
{
    "insecure-registries": ["10.210.1.243:5000"]
}
```

restart docker

```sudo systemctl stop docker and sudo systemctl start docker```

2. Installed local path as a provisioner 

```kubectl apply -f https://raw.githubusercontent.com/rancher/local-path-provisioner/master/deploy/local-path-storage.yaml```

3. Deploy statefullset

```kubectl apply -f statefulset.yml``` 

4. Results
Events:
  Type    Reason     Age   From                 Message
  ----    ------     ----  ----                 -------
  Normal  Scheduled  5s    default-scheduler    Successfully assigned litecoin/litecoin-0 to k8s-node-1
  Normal  Pulling    4s    kubelet, k8s-node-1  Pulling image "10.210.1.243:5000/litecoin:0.18.1"
  Normal  Pulled     1s    kubelet, k8s-node-1  Successfully pulled image "10.210.1.243:5000/litecoin:0.18.1"
  Normal  Created    1s    kubelet, k8s-node-1  Created container main
  Normal  Started    0s    kubelet, k8s-node-1  Started container main
