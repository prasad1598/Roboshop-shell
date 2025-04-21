dnf module disable nodejs -y
dnf module enable nodejs:20 -y
dnf install nodejs -y
cp cart.service vim /etc/systemd/system/cart.service

useradd roboshop
mkdir /app
rm /tmp/*
curl -L -o /tmp/cart.zip https://roboshop-artifacts.s3.amazonaws.com/cart-v3.zip
cd /app
rm /app/*
unzip /tmp/cart.zip
npm install
systemctl daemon-reload
systemctl enable cart
systemctl start cart