# Elastic Beanstalk, Docker & Django
============================================

This project contains a Docker container ready to use as a bolilerplate for Elastic Beanstalk.

Django 1.8+ running Python 3.4.+ on AWS.

Require:

* AWS Access Key ID
* AWS Secret Key
* Service Region
* Application Name
* Enviroment Name
* Git

Set a virtualenv with::
`virtualenv venv`

Install **awsebcli** with pip::
`pip install awsebcli`


You can use this project running::
`django-admin.py startproject --template=https://github.com/rafaelmv/DYS-WorkShop/zipball/master`


To start use::
`eb init`

This command ask you for some data and then you can start to create your project.


To create your project and deploy the first version use::
`eb create`

That create a container with your project.

Wait a few minutes because the project is setting up, then only use::
`eb open`
and this open a new tab in your browser.

For any new deploy use::
`eb deploy`

Link to the [project](http://demo-dev.elasticbeanstalk.com/)


