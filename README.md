# Project Overview

Production site: Not available yet.

Development site: http://ascent-jet.revolucija.webfactional.com/

Write _short_ project summary here...

**TODO link to more detailed project overview**

**TODO link other documents, like requirements**


# Project Management

[Basecamp](https://basecamp.com/1790140/projects/7056316)


# Design

[Invision](https://projects.invisionapp.com/d/main#/projects/2069859)


# Development

## Clone project and setup dev environment
```
#!python

cd ~/work
git clone git@bitbucket.org:revolucija/ascent_jet.git
cd ascent_jet
mkvirtualenv ascent_jet
. profile
pip install -r requirements.txt
```

## Restore Production Database and media/ Locally

When prompted for postgres password, use the one from [production](https://bitbucket.org/revolucija/ascent_jet/src/4c6cf13d09b82c79ed7bc2ce05c4ecbf192c9d1f/production?at=master) file.

```
#!python

ssh revolucija@dweb183.webfaction.com -A
cd webapps/ascent_jet
pg_dump -U ascent_jet ascent_jet -f ascent_jet_dump.sql
tar czf media.tar.gz media/

# Download ascent_jet_dump.sql and media.tar.gz via terminal or FTP/Filezilla
# Download via terminal - SCP
scp revolucija@dweb183.webfaction.com:~/webapps/ascent_jet/media.tar.gz . 
scp revolucija@dweb183.webfaction.com:~/webapps/ascent_jet/ascent_jet_dump.sql . 
tar xvzf media.tar.gz
cp -r media/ ~/work/ascent_jet
```

When prompted for postgres password, use the one from [profile](https://bitbucket.org/revolucija/ascent_jet/src/25bd7a387e30a0f6537f9a74ec914fbffe2b3b82/profile?at=master) file.
```
#!python
sudo -u postgres createuser -D -P ascent_jet
sudo -u postgres createdb -O ascent_jet ascent_jet
sudo -u postgres psql -h localhost -d ascent_jet -U ascent_jet -f ascent_jet_dump.sql
```

## Run Project Locally
```
#!python

cd ~/work/ascent_jet
. profile

# pull new commits
git pull --rebase

# if database models have changed run migrations
django-admin migrate

django-admin runserver

# This is not necessary step if you have admin account in production, because that same admin
# will be available when you restore production db. However, if you need to create admin user run:
django-admin createsuperuser
```

## Deploy Project
```
#!python

git push origin master
fab deploy
```

## Frontend


## Backend

[API Docs](https://bitbucket.org/revolucija/ascent_jet/wiki/API%20Docs)
[Backend Docs](https://bitbucket.org/revolucija/ascent_jet/wiki/Backend%20Docs)

# Who do I talk to?

* Project Manager: Damir P.
* Designer: Alen S.
* Frontend dev: Davor B.
* Backend dev: Ozren L.

## Who has accounts 

* Web superuser:
* Web admin:
* Google analytics (webmastertools):
* External accounts (if exists):