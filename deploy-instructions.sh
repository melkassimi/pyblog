# -----------------------------------------------------------------------------
# ON YOUR DEVELOPMENT COMPUTER
# -----------------------------------------------------------------------------
# prepare dependencies
pip freeze > requirements.txt

# -----------------------------------------------------------------------------
# ON YOUR SERVER
# -----------------------------------------------------------------------------
# Update Ubuntu packages
sudo apt update
sudo apt upgrade

# Install pip and prepare virtualenv
sudo apt install python3-pip
sudo pip3 install virtualenv
virtualenv venv
source venv/bin/activate
# deactivate

# prepare resources
pip install -r requirements.txt
python manage.py collectstatic
python manage.py migrate
python manage.py createsuperuser

# to test python installation
python manage.py runserver 0.0.0.0:8000

# install gunicorn
pip install gunicorn
gunicorn --bind 172.28.128.3:8001 pyblog.wsgi
gunicorn --daemon --workers 3 --bind 127.0.0.1:8001 pyblog.wsgi

# install nginx
sudo apt install nginx
sudo service nginx restart
