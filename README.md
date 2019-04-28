## Environmen
+ django-jet: 1.0.8

## Usage
1. Make sure that your mysql is running
```
systemctl start mysql
```
2. Load mysql data to the database
```
mysql>create database bookmanage default charset utf8;
mysql>use bookmanage;
mysql>source data/bookmanage.sql;
```
3. Run server
```
python manage.py runserver
# python manage.py runserver 10.180.xx.xx:8000
```

