#!/bin/sh
rm -rf apache
#sudo yum remove java -y
sudo yum install java -y
java -version
md5hash=$(md5sum apache-tomcat-10.0.7.tar.gz | cut -d" " -f1 )
echo "Hash is $md5hash"
if [[ -f "apache-tomcat-10.0.7.tar.gz" && $(md5sum apache-tomcat-10.0.7.tar.gz | cut -d" " -f1 ) == "7eac2904895534d21f40b486da4e366d" ]]
then
  echo "-------------------Zip exists----------------------"
else
	wget https://downloads.apache.org/tomcat/tomcat-10/v10.0.7/bin/apache-tomcat-10.0.7.tar.gz
fi
mkdir apache
tar -xvf apache-tomcat-10.0.7.tar.gz -C apache 
cd apache/apache-tomcat-10.0.7
ls
cd bin
ls
sh startup.sh
