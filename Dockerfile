FROM registry.access.redhat.com/jboss-eap-6/eap-openshift:6.4
EXPOSE 8080 8888
USER root
ENV JBOSS_HOME /opt/jboss/jboss-eap-6.4
RUN $JBOSS_HOME/bin/add-user.sh jboss TigoJboss2016! --silent
RUN curl https://raw.githubusercontent.com/VeerMuchandi/ps/master/deployments/ROOT.war -o $JBOSS_HOME/standalone/deployments/ROOT.war

#FROM jboss/base-jdk:7

#ADD installs/jboss-eap-6.3.0.zip /tmp/jboss-eap-6.3.0.zip
#RUN unzip /tmp/jboss-eap-6.3.0.zip

## allow custom external configuration
#ADD standalone-custom.xml /opt/jboss/jboss-eap-6.3/standalone/configuration/

### Set Environment
#ENV JBOSS_HOME /opt/jboss/jboss-eap-6.4

### Create EAP User
#RUN $JBOSS_HOME/bin/add-user.sh jboss mypassword --silent

#USER root
#RUN chmod 755 /opt/jboss/jboss-eap-6.4/standalone/deployments/*
#RUN chown jboss:jboss /opt/jboss/jboss-eap-6.4/standalone/deployments/*
#ADD myear.ear /opt/jboss/jboss-eap-6.4/standalone/deployments/
#RUN curl https://raw.githubusercontent.com/VeerMuchandi/ps/master/deployments/ROOT.war -o $JBOSS_HOME/standalone/deployments/ROOT.war
#USER jboss

### Configure EAP
#RUN echo "JAVA_OPTS=\"\$JAVA_OPTS -Djboss.bind.address=0.0.0.0 -Djboss.bind.address.management=0.0.0.0\""  >> $JBOSS_HOME/bin/standalone.conf

### Open Ports
#EXPOSE 8080 9990 9999

### Start EAP
##  ENTRYPOINT $JBOSS_HOME/bin/standalone.sh -c standalone.xml

#CMD ["/opt/jboss/jboss-eap-6.4/bin/standalone.sh", "-b", "0.0.0.0", "-bmanagement", "0.0.0.0"]


