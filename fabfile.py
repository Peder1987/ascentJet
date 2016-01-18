from fabric.api import task, env, run, cd, local
from fabric.colors import red
from fabric.contrib.files import exists
from fabric.contrib.console import confirm
from fabric.context_managers import prefix

env.hosts = ('revolucija@dweb183.webfaction.com',)
env.forward_agent = True

CELERY_ROOT = '/home/revolucija/apps/supervisord/'
PROJCET_REPO_URL = 'git@github.com:revolucija/ascent_jet.git'
PROJECT_FOLDER = 'ascent_jet'
PROJECT = 'ascent_jet'
PROJECT_ROOT = '/home/revolucija/webapps/{}/'.format(PROJECT_FOLDER)
PROJECT_REPO = PROJECT_ROOT + 'code/'
PROJECT_WSGI = PROJECT_REPO + '{}/{}/'.format(PROJECT, PROJECT)
MANAGEPY = '~/webapps/{}/code/{}/manage.py'.format(PROJECT_FOLDER, PROJECT)
PY = '~/webapps/{}/env/bin/python2.7'.format(PROJECT_FOLDER)

import xmlrpclib
import os
import random
from string import ascii_letters, digits


def generate_name(length=12):
    return ''.join([random.choice(ascii_letters + digits) for i in range(length)])


@task
def ls():
    with cd(PROJECT_REPO):
        run('ls -la')


@task
def cat(filename):
    with cd(PROJECT_REPO):
        run('cat {}'.format(filename))


@task
def install_requirements():
    with cd(PROJECT_REPO):
        with prefix('source production'):
            run('pip install -r requirements.txt')


@task
def dj(command='help'):
    with cd(PROJECT_REPO):
        with prefix('source production'):
            run('{} {} {}'.format(PY, MANAGEPY, command))


@task
def collect_static(command='collectstatic --noinput'):
    with cd(PROJECT_REPO):
        with prefix('source production'):
            run('{} {} {}'.format(PY, MANAGEPY, command))


@task
def apache(command='restart'):
    with cd(PROJECT_ROOT):
        run('apache2/bin/{}'.format(command))


@task
def errors(lines='10'):
    run('tail -n {} ~/logs/user/error_{}.log'.format(lines, PROJECT_FOLDER))


@task
def ps():
    run('ps -u revolucija -o rss,pid,command | grep webapps/{}'.format(PROJECT_FOLDER))


@task
def memcached(command='stats'):
    with cd(PROJECT_ROOT):
        if not exists('memcached.sock'):
            print(red('Memcached isn\'t running!'))
            if confirm('Run memcached (16 MB)?'):
                run('memcached -d -m 16 \
                     -s {0}memcached.sock -P {0}memcached.pid'.format(PROJECT_ROOT))
                run('sleep 2')
            else:
                return
        run('echo \'{}\' | nc -U memcached.sock'.format(command))


@task
def kill_memcached():
    with cd(PROJECT_ROOT):
        if not exists('memcached.pid'):
            print(red('Memcached pid is not known!'))
        else:
            run('kill $(cat memcached.pid)')
            run('rm memcached.pid')
            run('rm memcached.sock')


@task
def syncdb():
    with cd(PROJECT_REPO):
        with prefix('source production'):
            run('{} {} syncdb'.format(PY, MANAGEPY))
            run('{} {} migrate'.format(PY, MANAGEPY))


@task
def restart_server():
    with cd(PROJECT_WSGI):
        run('touch wsgi.py')


@task
def pull_project():
    with cd(PROJECT_REPO):
        run('git pull --rebase origin master')


@task
def deploy():
    pull_project()
    install_requirements()
    syncdb()
    collect_static()
    restart_server()


@task
def psr():
    pull_project()
    collect_static()
    restart_server()


@task
def bootstrap():
    with cd(PROJECT_ROOT):
        if not exists('env'):
            run('virtualenv --system-site-packages -p python2.7 env')
        else:
            print(red('Env already created.'))
        if not exists('code'):
            run('git clone {} code'.format(PROJCET_REPO_URL))
            install_requirements()
            syncdb()
            collect_static()
            print(red('Now make changes to apache conf and restart.'))
        else:
            print(red('Repo already cloned.'))


@task
def restart_celery():
    with cd(PROJECT_REPO):
        with prefix('source celery_production'):
            run('supervisorctl -c {}supervisor.conf restart celeryd_{}'.format(CELERY_ROOT, PROJECT))


def resolve_variables(value):
    v = value.replace('$PWD', os.environ.get('PWD'))
    v = v.replace('$PYTHONPATH', os.environ.get('PYTHONPATH', ''))
    return v


@task
def bootstrap_wf():
    server = xmlrpclib.ServerProxy('https://api.webfaction.com/')
    session_id, account = server.login('revolucija', '6Fv8hsS2', 'Dweb183')
    PASSWORD = generate_name()
    with open('production', 'a') as f:
        f.write('export DATABASE_URL=postgres://{PROJECT}:{PASSWORD}@localhost:5432/{PROJECT}\n'.format(PROJECT=PROJECT, PASSWORD=PASSWORD))
    server.create_db(session_id, PROJECT, 'postgresql', PASSWORD)
    server.create_domain(session_id, 'revolucija.webfactional.com', PROJECT.replace('_', '-'))
    server.create_app(session_id, PROJECT, 'django165_mw34_27')
    server.create_app(session_id, PROJECT + '_media', 'symlink_static_only', False, PROJECT_ROOT + 'media')
    server.create_website(
        session_id,
        PROJECT,
        '85.17.227.30',
        False,
        [PROJECT.replace('_', '-') + '.revolucija.webfactional.com'],
        [PROJECT, '/'],
        [PROJECT + '_media', '/media']
    )
