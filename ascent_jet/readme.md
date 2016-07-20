cp ascent_jet /var/www/ -R
cd /var/www/ascent_jet
virtualenv env
source env/bin/activate
pip install -r requirements.txt
export PWD=/var/www/ascent_jet


cp 000-default.conf.example /etc/apache2/sites-available/000-default.conf

sudo apache2 reload
sudo apache2 restart


# if it does not working well, please check /var/log/apache2/error.log
sudo chmod 777 ./ascent_jet/info.log
