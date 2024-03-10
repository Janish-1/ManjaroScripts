yay postgresql pgadmin4
sudo -u postgres -i
initdb --locale $LANG -E UTF8 -D '/var/lib/postgres/data/'
exit
sudo systemctl enable --now postgresql
sudo systemctl status postgresql
psql -U postgres
postgres=# \password # to set password
su
cd /var/lib/postgres/data
cp pg_hba.conf pg_hba.conf.backup
# change trust to md5
nano pg_hba.conf 