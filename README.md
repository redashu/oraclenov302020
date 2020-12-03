# K8s application deployment platform for containers


## checking and deleting all the pods

```
❯ kubectl get po
NAME          READY   STATUS    RESTARTS   AGE
pod1          1/1     Running   1          16h
ranganath     1/1     Running   1          16h
rk            1/1     Running   1          16h
rohitpod-2    1/1     Running   1          16h
sathishpod1   1/1     Running   1          16h
svpod1        1/1     Running   1          16h
swamypod1     1/1     Running   1          16h
tkbpod        1/1     Running   1          16h
❯ kubectl delete pods --all
pod "pod1" deleted
pod "ranganath" deleted
pod "rk" deleted
pod "rohitpod-2" deleted
pod "sathishpod1" deleted
pod "svpod1" deleted
pod "swamypod1" deleted
pod "tkbpod" deleted



```

## generate yaml or json file 

```
❯ kubectl  run  ashupod2  --image=nginx --port=80  --dry-run=client
pod/ashupod2 created (dry run)
❯ kubectl  run  ashupod2  --image=nginx --port=80  --dry-run=client  -o yaml
apiVersion: v1
kind: Pod
metadata:
  creationTimestamp: null
  labels:
    run: ashupod2
  name: ashupod2
spec:
  containers:
  - image: nginx
    name: ashupod2
    ports:
    - containerPort: 80
    resources: {}
  dnsPolicy: ClusterFirst
  restartPolicy: Always
status: {}


```

## storing yaml / json in a file 

```
kubectl  run  ashupod2  --image=nginx --port=80  --dry-run=client  -o yaml  >ashupod2.yml

```

## recreating pod 

```
❯ kubectl  replace -f ashupod2.yml --force
pod "ashupod2" deleted
pod/ashupod2 replaced

```

## some commands

```
❯ kubectl  get  pods  ashupod2  -o wide
NAME       READY   STATUS    RESTARTS   AGE     IP                NODE            NOMINATED NODE   READINESS GATES
ashupod2   1/1     Running   0          3m45s   192.168.174.206   minion-node-3   <none>           <none>
❯ kubectl  get  pods   -o wide
NAME          READY   STATUS    RESTARTS   AGE     IP                NODE            NOMINATED NODE   READINESS GATES
ashupod2      1/1     Running   0          4m49s   192.168.174.206   minion-node-3   <none>           <none>
ironman       1/1     Running   0          6m47s   192.168.97.76     minion-node-2   <none>           <none>
nav           1/1     Running   0          7m33s   192.168.97.75     minion-node-2   <none>           <none>
poddemo3      1/1     Running   0          7m40s   192.168.138.76    minion-node-1   <none>   

```


## creating service in k8s 

<img src="service.png">


## more service in k8s

<img src="s1.png">

## defining label in pod 

```
❯ cat ashupod1.yml
apiVersion: v1
kind: Pod
metadata:
 name: ashupod1 # unique name will be required
 labels:  #  label is the thing to find pod by any other resource in k8s
  x: ashuapp1   # label must contain a key: value pair and it must be unique 
  y: helloashu
spec:
 containers:
 - image: nginx  # image will be pulled from Docker hub 
   name: ashuc1  # name of container under my pod
   ports: # default port of nginx web server 
   - containerPort: 80
   
```


## checking labels of pods 

```
❯ kubectl get po ashupod2   --show-labels
NAME       READY   STATUS    RESTARTS   AGE   LABELS
ashupod2   1/1     Running   0          39m   run=ashupod2


❯ kubectl get po ashupod2   --show-labels -o wide
NAME       READY   STATUS    RESTARTS   AGE   IP                NODE            NOMINATED NODE   READINESS GATES   LABELS
ashupod2   1/1     Running   0          39m   192.168.174.206   minion-node-3   <none>           <none>            run=ashupod2


```

## k8s networking explaining service type 

<img src="stype.png">

## one more for service 

<img src="ss11.png">

## end user to pod 

<img src="e2p.png">


