FROM iamdevopstrainer/tomcat:base
COPY abc-tech.war /usr/local/tomcat/webapps/
CMD ["catalina.sh","run"]
