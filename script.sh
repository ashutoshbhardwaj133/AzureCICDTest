#!/bin/bash

sudo apt update -y

sudo apt install docker.io -y

sudo docker run -d --name sonarqube -e SONAR_ES_BOOTSTRAP_CHECKS_DISABLE=true -p 9000:9000 sonarqube:latest

sudo docker run -d -p 8081:8081 --name nexus sonatype/nexus3