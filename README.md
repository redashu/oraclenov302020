# FInaly 

# COntainer based tech

['podman'] ('https://podman.io/')

## app deployment in k8s 

<img src="appdep.png">

## Deploy mysql DB in K8s 

<img src="db.png">

### 

```
kubectl  create  deployment  ashudb  --image=mysql -n ashu-space  --dry-run=client -o yaml >ashudb.yml

```
## Env in yaml file in K8s

```
❯ cat  ashudb.yml
apiVersion: apps/v1
kind: Deployment
metadata:
  creationTimestamp: null
  labels:
    app: ashudb
  name: ashudb  # name of deployment 
  namespace: ashu-space  # name of namespace 
spec:
  replicas: 1
  selector:
    matchLabels:
      app: ashudb
  strategy: {}
  template:
    metadata:
      creationTimestamp: null
      labels:
        app: ashudb   # label of pod
    spec:
      containers:
      - image: mysql   # image from docker hub 
        name: mysql  # name of container 
        ports:
        - containerPort: 3306  # default port 
        env:  #  to define/replace env variable
        - name: MYSQL_ROOT_PASSWORD
          valueFrom:
           secretKeyRef:  # to use secret it is a keyword 
            name: ashudbinfo # name of secret 
            key: sqlpw  # key we assigned during secret creation 

        resources: {}

```
## Secret as New k8s api Resources 

### creating secret to store db password

```
❯ kubectl  create  secret   generic  ashudbinfo  --from-literal  sqlpw=oracle123  -n ashu-space
secret/ashudbinfo created
```
##

```
❯ kubectl  describe  secret  ashudbinfo  -n ashu-space
Name:         ashudbinfo
Namespace:    ashu-space
Labels:       <none>
Annotations:  <none>

Type:  Opaque

Data
====
sqlpw:  9 bytes

```


## checking base64 based encoded information in secret

```
 kubectl get secret ashudbinfo  -o yaml  -n ashu-space
apiVersion: v1
data:
  sqlpw: b3JhY2xlMTIz
kind: Secret

```
