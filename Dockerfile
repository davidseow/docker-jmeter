FROM		hauptmedia/java:oracle-java7

ENV     	DEBIAN_FRONTEND noninteractive

ENV		JMETER_VERSION	3.0
ENV		JMETER_HOME	/opt/jmeter
ENV		JMETER_DOWNLOAD_URL  http://mirror.serversupportforum.de/apache/jmeter/binaries/apache-jmeter-${JMETER_VERSION}.tgz

# install needed debian packages & clean up
RUN		apt-get update && \
		apt-get install -y --no-install-recommends curl tar ca-certificates unzip && \
		apt-get clean autoclean && \
        	apt-get autoremove --yes && \
        	rm -rf /var/lib/{apt,dpkg,cache,log}/

# download and extract jmeter
RUN		mkdir -p ${JMETER_HOME} && \
		curl -L --silent ${JMETER_DOWNLOAD_URL} | tar -xz --strip=1 -C ${JMETER_HOME} && \
		curl -L --silent http://jmeter-plugins.org/downloads/file/JMeterPlugins-Standard-1.2.1.zip -o /tmp/jmeter-plugins-standard.zip && \
		unzip -o -d /opt/jmeter/ /tmp/jmeter-plugins-standard.zip && \
		rm /tmp/jmeter-plugins-standard.zip

# install jmeter plugin manager & upgrade cmdrunner
RUN		curl -L --silent https://repo1.maven.org/maven2/kg/apc/jmeter-plugins-manager/0.8/jmeter-plugins-manager-0.8.jar -o ${JMETER_HOME}/lib/ext/jmeter-plugins-manager-0.8.jar && \
		curl -L --silent http://search.maven.org/remotecontent?filepath=kg/apc/cmdrunner/2.0/cmdrunner-2.0.jar -o ${JMETER_HOME}/lib/cmdrunner-2.0.jar

# set / generate config
RUN		java -cp ${JMETER_HOME}/lib/ext/jmeter-plugins-manager-0.8.jar org.jmeterplugins.repository.PluginManagerCMDInstaller
RUN chmod +x ${JMETER_HOME}/bin/*.sh
RUN		${JMETER_HOME}/bin/PluginsManagerCMD.sh install jpgc-json

WORKDIR		${JMETER_HOME}
