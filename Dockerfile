FROM registry.access.redhat.com/jboss-eap-6/eap-openshift:6.4
USER root
RUN chmod 644 /etc/nsswitch.conf
RUN adduser jboss --uid 1000 --home /home/jboss --disabled-password
USER jboss
EXPOSE 8080 8888
RUN curl https://raw.githubusercontent.com/VeerMuchandi/ps/master/deployments/ROOT.war -o $JBOSS_HOME/standalone/deployments/ROOT.war


#FROM registry.access.redhat.com/jboss-eap-6/eap64-openshift
#RUN yum -y install nss_wrapper gettext
#ADD passwd.template ${HOME}
#RUN export USER_ID=$(id -u)
#RUN export GROUP_ID=$(id -g)
#RUN envsubst < ${HOME}/passwd.template > /tmp/passwd
#RUN export LD_PRELOAD=libnss_wrapper.so
#RUN export NSS_WRAPPER_PASSWD=/tmp/passwd
#RUN export NSS_WRAPPER_GROUP=/etc/group
#USER root
#EXPOSE 8080 8888

#RUN /opt/jboss/jboss-eap-6.4/bin/add-user.sh jboss TigoJboss2016! --silent
#RUN curl https://raw.githubusercontent.com/VeerMuchandi/ps/master/deployments/ROOT.war -o /opt/jboss/jboss-eap-6.4/standalone/deployments/ROOT.war

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


