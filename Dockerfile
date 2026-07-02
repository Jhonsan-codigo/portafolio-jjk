FROM tomcat:9.0-jdk11
COPY target/CEjemplo09-1.0-SNAPSHOT.war /usr/local/tomcat/webapps/ROOT.war
EXPOSE 8080
CMD ["catalina.sh", "run"]