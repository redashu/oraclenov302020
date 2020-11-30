# Containers 

## deployment model of apps

<img src="app.png">

## physical to containers 

<img src="p2c.png">


## containrers options for Container run time engine (CRE)

<img src="cre.png">

## Docker installation 

<img src="c_install.png">

## Docker desktop on windows 10

[docker desktop] (https://hub.docker.com/editions/community/docker-ce-desktop-windows/)

## Docker desktop on mac os

[docker desktop] ('https://hub.docker.com/editions/community/docker-ce-desktop-mac')


## installation link of docker ce 

[docker docs] ('https://docs.docker.com/engine/install/centos/')

## install docker on aws ec2 instances

```
[root@ip-172-31-75-167 ~]# yum install docker -y
Failed to set locale, defaulting to C
Loaded plugins: extras_suggestions, langpacks, priorities, update-motd
amzn2-core                                                         | 3.7 kB  00:00:00     
Resolving Dependencies
--> Running transaction check
---> Package docker.x86_64 0:19.03.13ce-1.amzn2 will be installed
--> Processing Dependency: runc >= 1.0.0 for package: docker-19.03.13ce-1.amzn2.x86_64
--> Processing Dependency: con

```

## starting docker engine 

```
[root@ip-172-31-75-167 ~]# systemctl start docker 
[root@ip-172-31-75-167 ~]# systemctl enable docker 
Created symlink from /etc/systemd/system/multi-user.target.wants/docker.service to /usr/lib/systemd/system/docker.service.

```
