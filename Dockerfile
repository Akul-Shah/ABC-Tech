FROM iamdevopstrainer/tomcat:base
COPY ABC-Tech.war /usr/local/tomcat/webapps/
CMD ["catalina.sh","run"]
