sudo update-alternatives --install "/usr/bin/java" "java" "/usr/local/java/jdk1.8.0_152/jre/bin/java" 1
sudo update-alternatives --install "/usr/bin/java" "java" "/usr/local/java/jdk1.8.0_152/bin/java" 1
sudo update-alternatives --install "/usr/bin/javaws" "javaws" "/usr/local/java/jdk1.8.0_152/jre/bin/javaws" 1

sudo update-alternatives --set java /usr/local/java/jdk1.8.0_152/jre/bin/java
sudo update-alternatives --set java /usr/local/java/jdk1.8.0_152/bin/java
sudo update-alternatives --set javaws /usr/local/java/jdk1.8.0_152/jre/bin/javaws

sudo echo "JAVA_HOME=/usr/local/java/jdk1.8.0_152" >> /etc/profile

sudo echo "JRE_HOME=$JAVA_HOME/jre" >> /etc/profile
sudo echo "PATH=$PATH:$JAVA_HOME/bin:$JRE_HOME/bin" >> /etc/profile
sudo echo "export JAVA_HOME" >> /etc/profile
sudo echo "export JRE_HOME" >> /etc/profile
sudo echo "export PATH" >> /etc/profile
