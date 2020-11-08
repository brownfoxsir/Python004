# 一、安装django

```python
# 创建虚拟环境
python -m venv venv
# 安装django
pip isntall django
```

# 二、初始化项目

```python
# 创建recruitment项目
django-admin startproject recruitment
# 运行recruitment项目
# 默认开启127.0.0.1:8000端口
python manage.py runserver
# 指定端口运行
python manage.py runserver 8080
# 指定ip以及端口运行 0 is a shortcut for 0.0.0.0
python manage.py runserver 0:8000
# 检查 INSTALLED_APPS 设置，创建相应数据表，并进行数据迁移
python manage.py migrate
# 创建超级用户
python manage.py createsuperuser
'''
Username (leave blank to use 'derek'): admin
Email address: admin@admin.com
Password:
Password (again):
The password is too similar to the username.
This password is too short. It must contain at least 8 characters.
This password is too common.
Bypass password validation and create user anyway? [y/N]: y
Superuser created successfully.
'''
# settings文件设置
# 将网站语言en-us为中文
LANGUAGE_CODE = 'zh-hans'
# 修改UTC时间为东八区
TIME_ZONE = 'Asia/Shanghai'
```

### **python manage.py help:**

```python 
❯ python .\manage.py help

Type 'manage.py help <subcommand>' for help on a specific subcommand.

Available subcommands:

[auth]
    changepassword
    createsuperuser

[contenttypes]
    remove_stale_contenttypes

[django]
    check
    compilemessages
    createcachetable
    dbshell
    diffsettings
    dumpdata
    flush
    inspectdb
    loaddata
    makemessages
    makemigrations
    migrate
    sendtestemail
    shell
    showmigrations
    sqlflush
    sqlmigrate
    sqlsequencereset
    squashmigrations
    startapp
    startproject
    test
    testserver

[sessions]
    clearsessions

[staticfiles]
    collectstatic
    findstatic
    runserver
```

