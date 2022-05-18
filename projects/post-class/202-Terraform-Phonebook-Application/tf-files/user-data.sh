#! /bin/bash
yum update -y
yum install python3 -y
pip3 install flask
pip3 install flask_mysql
yum install git -y
TOKEN="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"
cd /home/ec2-user && git clone https://$TOKEN@github.com/engin777/phonebook.git
python3 /home/ec2-user/phonebook/phonebook-app.py