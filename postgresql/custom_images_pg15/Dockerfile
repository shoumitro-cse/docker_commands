FROM postgres

ENV POSTGRES_PASSWORD 1234
ENV POSTGRES_USER postgres
ENV POSTGRES_DB feedback_testing

RUN apt-get -y update
RUN apt-get install -y apt-utils nano nginx
#RUN apt-get install -y apt-utils nano ffmpeg nginx

#RUN apt-get install -y postgresql postgresql-client

       
WORKDIR /postgresql_data
COPY . /postgresql_data

#COPY ./replica_data /var/lib/postgresql/data


# CMD ["/bin/bash", "setup.sh"]
#ENTRYPOINT ["/bin/bash", "server_config/setup.sh"]

