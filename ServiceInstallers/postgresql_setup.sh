sudo pacman -Syu
sudo pacman -S postgresql
sudo chown -c -R postgres:postgres /var/lib/postgres
sudo mkdir /run/postgresql/; 
sudo chown -c -R postgres:postgres /run/postgresql/
su
su postgres
initdb -D /var/lib/postgres/data
pg_ctl -D /var/lib/postgres/data start
exit
sudo systemctl status postgresql
sudo systemctl restart postgresql
sudo systemctl start postgresql
sudo systemctl enable postgresql
su
su postgres
pg_isready
exit