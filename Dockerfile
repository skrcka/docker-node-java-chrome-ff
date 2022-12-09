FROM node:latest-buster

RUN apt-get update

#Install Google Chrome
RUN wget --quiet https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN apt install -y ./google-chrome-stable_current_amd64.deb

#Install Openjdk 8
RUN apt-get install default-jre -y

#Install firefox
RUN apt-get purge firefox-esr
RUN echo deb http://downloads.sourceforge.net/project/ubuntuzilla/mozilla/apt all main | tee -a /etc/apt/sources.list > /dev/null
RUN apt-key adv --recv-keys --keyserver keyserver.ubuntu.com CCC158AFC1289A29
RUN apt-get install apt-transport-https -y
RUN apt-get update
RUN apt-get install firefox-mozilla-build -y
RUN apt install --reinstall libdbus-glib-1-2 -y

COPY . .
COPY tests.sh /usr/local/bin
