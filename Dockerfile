FROM tomcat:9
COPY target/art-digital.war /usr/local/tomcat/webapps/ROOT.war
