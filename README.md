# spam_message_detection

### streamlit web application link (Hosted on render.com) -> https://spam-message-detection-sj.onrender.com/

1) Create virtual envirinment myenv using command **python -m venv .myenv** and activate this myenv virtual envirinment using this command **Source activate .myenv** and follow below steps
2) because nltk is big library so we have to give the corpus /function we want from it so that only that is downloaded on server and deployed......otherwise we get error<br>
3) whatever lib u mentioned in requirements.txt can be downloaded in ur myenv by executing this command in cmd --> pip install -r requirements.txt <br>
4) i am going to deploy this model using Dockers and Github action(CI/CD pipeline ie;as soon as i commit something chnage from myside to github then(using git push)the automatic deployment will occur w/o humans regular involvement),,MLOPS kind of thing..<br>
ie;i create a Docker image on my side,,,and run it in container(like a virtual m/c which downloads all dependecy what we mentioned in Dockerfile form Docker_HUB with base o.s as linux if we didnt mention any o.s)  ...<br>
5) we share this Docker image on heroku ,,there this image is runned as container,,,,and our website is running in this container,,,like this we deploy our model.. <br>

