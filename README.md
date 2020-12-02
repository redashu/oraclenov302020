# Container recap

<img src="crecap.png">

## compose with apache tomcat 

```
version: "3.8"
services:
 javaapp:
  image: ashutomcat:v0011
  build: .
  container_name: ashutomc1
  restart: always
  networks:
   - ashubr11  # using custom network 
  ports:
   - "7700:8080"  # similar to docker -p 7700:8080 
     
networks:
 ashubr11:  # creating custom network 
 
 ```
 
 ## docker compsoe history 
 
 ```
  744  docker-compose -f ashutoshh.yaml down
 
  746  docker-compose -f ashutoshh.yaml  up --build  -d
  747  history 
  748  docker-compose -f ashutoshh.yaml  ps
  ```
  
  # Container based app problems 
  
  <img src="appprob.png">
  
  ## container orchestration 
  
  <img src="corch.png">
  
  ## k8s history 
  
  <img src="khist.png">
  
  ## k8s arch level 1
  
  <img src="k8sl1.png">


## k8s arch kube apiserver 

<img src="k8sapiserver.png">

## k8s arch kube-schedular

<img src="ksch.png">

## k8s node and replication controller

<img src="nrc.png">

## k8s etcd 

<img src="etcd.png">

## k8s minion network CNI & kube proxy

<img src="cniproxy.png">

