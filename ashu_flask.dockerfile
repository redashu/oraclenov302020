from  python
# from 2020 python 3 will be the default option 
maintainer  ashutoshh , ashutoshh@linux.com , 9509957594
RUN  pip install  flask
#  here we are using python installer to install flask framework 
RUN mkdir  /ashuapp
WORKDIR /ashuapp
COPY .  .
# copy all data from current host to docker image under  /ashuapp location 
EXPOSE 5000
ENTRYPOINT  ["python"]
CMD  ["demo.py"]
