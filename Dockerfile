FROM ubuntu:20.04
ARG DEBIAN_FRONTEND="noninteractive"
WORKDIR /
COPY . .
RUN chmod 777 /
RUN apt-get -qq update
RUN apt-get -qq install -y python3 python3-pip locales python3-lxml pv jq unzip wget
RUN pip3 install --no-cache-dir -r requirements.txt && \
    wget -qq https://github.com/Nenokkadine/CDN/raw/master/Error403/fclone.zip && \
    unzip -qq fclone.zip
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8
RUN chmod +x fclone
CMD ["python3","telegram_gcloner/telegram_gcloner.py"]
