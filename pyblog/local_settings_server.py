import os

DEBUG = True

ALLOWED_HOSTS = ['172.28.128.3',]

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.sqlite3',
        'NAME': 'db.sqlite3',
    }
}


