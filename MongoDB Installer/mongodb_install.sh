flatpak install flathub com.mongodb.Compass
docker pull mongodb/mongodb-community-server:latest
docker run --name mongodb -p 27017:27017 -d mongodb/mongodb-community-server:latest
docker container ls
sudo sh mongosh_install.sh
mongosh --port 27017
db.runCommand(
   {
      hello: 1
   }
)