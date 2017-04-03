#!/bin/bash
mvn clean install -e -f  /usr/src/mymaven  &&
find . -name "*.war" -exec cp '{}' /usr/local/tomcat/webapps \;
