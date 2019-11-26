FROM tomcat:8.0

RUN rm -rf /usr/local/tomcat/webapps/*
RUN rm -rf /usr/local/tomcat/conf/tomcat-users.xml

ADD DataSync2019/www/ROOT.war /usr/local/tomcat/webapps/
ADD config/tomcat-users.xml /usr/local/tomcat/conf/

CMD ["catalina.sh", "run"]
