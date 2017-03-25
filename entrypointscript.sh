#!/bin/bash
mvn clean install &&
find . -name "*.war" -exec cp '{}' /usr/local/tomcat/webapps \;
