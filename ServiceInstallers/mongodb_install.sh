sudo pamac build mongodb-compass
sudo docker login
# janishpancholidocker and Jp@123456
sudo docker pull mongodb/mongodb-community-server:latest
sudo docker run --name mongodb -p 27017:27017 -d mongodb/mongodb-community-server:latest
sudo docker container ls
mongosh --port 27017
db.runCommand(
   {
      hello: 1
   }
)