# containers with Docker using community edition 

## day2 agenda

<img src="agenda.png">

## containers clean up

```
[ec2-user@ip-172-31-75-167 ~]$ docker kill $(docker ps -q)
9860b9d7029f
f0eebb53cc27
5dc9f5eb7929
[ec2-user@ip-172-31-75-167 ~]$ docker rm  $(docker ps -aq)
3a3a5bb94ee8
9860b9d7029f
f0eebb53cc27
5dc9f5eb7929
89f79716e587
[ec2-user@ip-172-31-75-167 ~]$ docker  ps -a
CONTAINER ID        IMAGE               COMMAND 

```

## docker image clean up

```
[ec2-user@ip-172-31-75-167 ~]$ docker rmi  $(docker images -q)  -f
Untagged: nav:pythonapp1
Untagged: navneeth:apacheapp1
Deleted: sha256:b231bfef585a46168da02f10d02bbb0d082dbd647928dd181249c19ba97ecae5
Deleted: sha256:38df2acccc12f10e84dc3c4bbc1cde6a000d12361b2e52da9e8b93708226c12c
Deleted: sha256:4f367b8c90539d78fc589e101926fadadd66a202362fc4f5a14eb70bcbae1ddb
Deleted: sha256:d5cbe189dea4cdfced3459ca225f5178838a53749eaa18e01ce5fad40f2ed0b7
Deleted: sha256:d1de8707e29b00dc441247d8add6555e1bee3e5910cabb1ad887292357b056c6
Deleted: sha256:9d7cbe4867049491ca7a8dabbe37a597468cc3c9589c02a7df6469269c015aab
Deleted: sha256:c0872342c309b411596a982f8b4af2b968f5916f7fbadfd815ebfccbb5b8b2eb
Untagged: python:latest
Untagged: python@sha256:b6a9702c4b2f9ceeff807557a63a710ad49ce737ed85c46174a059a299b580f2
Deleted: sha256:a3fe352c53772546456396ede7a671fea7db15d8524ec91daa8b690adcf58fd1
Deleted: sha256:306bae6804888f5d81d5bb578eb245e72d906302eac0344055386afc2169f64d
Deleted: sha256:15bddf90695cd199ea8ffcd9517e8b2014f543fe5591ff56317491220638f105
Deleted: sha256:5e4792624d507a51e983591a1ddbeb988b00ea47b59ec0c266ff6ceb1e045ab3
Deleted: sha256:16e296291ea9808510c2c2ffded1766fdac23521f45917ac59421b979fd549fc
Deleted: sha256:fb78f5d256e23a25466b4bbeac715815978498e6a4dcf901f622bae575c4c01f
Deleted: sha256:be048ca7e7af3c225efaf44d9bf81c2d274d0860e563cd97e5f2630c958f24cd
Deleted: sha256:e93ebf51004cfe34370a8930dc7016c067a8c5cd4754b932dedca1739f0c6e29
Deleted: sha256:86569a54d5d4735f27748c0e5d9ead04f48d36bbaaeaa755a1e022a6eb32d650
Deleted: sha256:114ca5b7280f3b49e94a67659890aadde83d58a8bde0d9020b2bc8c902c3b9de
Error: No such image: b231bfef585a
[ec2-user@ip-172-31-75-167 ~]$ docker images
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
[ec2-user@ip-172-31-75-167 ~]$ docker ps -a
CONTAINER ID        IMAGE               COMMAND     

```

## Python flask based app 

```
 docker  build  -t  ashuflaskapp:v001  -f  ashu_flask.dockerfile .
 
```

### creating containers 

```
docker run --name ashuc1 -d -p 1100:5000 ashuflaskapp:v001 
```

# Docker image sharing 

<img src="imgshare.png">


## saving docker image as tar

```
[ec2-user@ip-172-31-75-167 ~]$ docker save  -o  ashuflask.tar  930c0e4f3e2a
[ec2-user@ip-172-31-75-167 ~]$ ls
ashuflask.tar  day1  day2
[ec2-user@ip-172-31-75-167 ~]$ ls  -lh ashuflask.tar 
-rw------- 1 ec2-user ec2-user 879M Dec  1 05:11 ashuflask.tar

```

## restoring docker image using tar file 

```
[ec2-user@ip-172-31-75-167 ~]$ docker images  |  grep -i ashu

[ec2-user@ip-172-31-75-167 ~]$ docker load -i ashuflask.tar 
4b563e087903: Loading layer [==================================================>]  6.144kB/6.144kB
Loaded image ID: sha256:930c0e4f3e2ae2c68a91ab31b70f7e11a92af78ec7403bb78911cf514c258124
[ec2-user@ip-172-31-75-167 ~]$ docker images  |  grep -i ashu
[ec2-user@ip-172-31-75-167 ~]$ docker images  |  grep -i 930
<none>                  <none>              930c0e4f3e2a        19 minutes ago      897MB


[ec2-user@ip-172-31-75-167 ~]$ docker  tag  930c0e4f3e2a   ashuflaskapp:v001  
[ec2-user@ip-172-31-75-167 ~]$ 
[ec2-user@ip-172-31-75-167 ~]$ docker images  |  grep -i ashu
ashuflaskapp            v001                930c0e4f3e2a        20 minutes ago      897MB

```

# docker registries 

<img src="reg.png">

## docker image name rules

<img src="imgname.png">


## image retention policy in docker hub 

```
Important announcement for #Docker Tech lovers from 2nd Nov 2020.

Pull rate limit from Docker Hub 
======================
1. For anonymous users :- 100 Images per 6 hours
2. Free authenticated users:- 200 Images per 6 hours
3. Docker Pro and Team subscribers (me) : No limits ( ha ha ha ha ha).
Image Retention policies:-
=================
Only for free Docker Users: after 6 months images will be delete in case of inactivity.

```
