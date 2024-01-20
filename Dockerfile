FROM python:3.7  
COPY . /app
WORKDIR /app
RUN pip install -r requirements.txt
EXPOSE $PORT
CMD gunicorn --workers=4 --bind 0.0.0.0:$PORT app:app

#FROM:3.7 ->which will download python3.7 image from DockerHub on base O.S Linux,,,ie;if u dont mention any o.s then bydefaultly linux is installed. and on linux os all files,s/w are installed 
#DockerHub contains all base images(s/w),,,,thus when this line is encounter then Docker will download linux image and on that python image(s/w) is installed
#COPY . /app  -> copy the all files in cwd to /app folder within linux base image....ie;inside linux python is installed and in linux these cwd files are copied inside /app folder (/app is created)
#copying all local files (.)  to base image
#WORKDIR /app -> setting  /app as cwd in base image 
#EXPOSE $PORT -> when this docker image(base os is linux and on that python is installed and copied the all files form local side(.) to taht base image)
#run as docker container  ,,then our app.py(application) is running in that container ,,so to access it we have to use prot number
#to access process uniquely we will use port Number.....
#no need to mention this port no priorly,,,bcz when ur docker image is run as container and application is executing within that container
#then docker will automatically expose the post no into $PORT variable
#ie;when application is hosted then cloud will automaticaly provide the PORT number to appliaction which is running inside the container

#CMD gunicorn --workers=4->helps to run our application in heroku....if 1000 request come to my application then 1000/4 =>250
#ecach worker handles 250 request at a time
#--bind 0.0.0.0:$PORT ->local ip address provided by heoku when application is running in container and bind it with generated port no..

#to configure Github actions to achieve CI/CD pipeling create .github/workflows/main.yaml
#as soon as i push this repo(spam_message_detection) to github account then what are all steps to perform is mentioned inside this main.yaml file,,,when github see this .github/workflows/main,yaml file then
#ie;create/build base/docker image then push this image as a docker container to heroku platform