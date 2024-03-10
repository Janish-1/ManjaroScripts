sudo pacman -S postgresql
postgres --version
sudo -iu postgres
initdb -D '/var/lib/postgres/data/'
exit
sudo systemctl enable postgresql
sudo -u postgres psql -c "initdb --locale=C.UTF-8 --encoding=UTF8 -D '/var/lib/postgres/data'"
sudo systemctl start postgresql
sudo systemctl status postgresql
sudo systemctl enable postgresql
sudo -u postgres psql -c "CREATE USER janish WITH ENCRYPTED PASSWORD 'janish11';"
sudo -u postgres psql -c "CREATE DATABASE postgres;"
sudo -u postgres psql -c "GRANT ALL PRIVILEGES ON DATABASE postgres TO janish;"
