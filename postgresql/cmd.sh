#https://dev.to/shree_j/how-to-install-and-run-psql-using-docker-41j2


# make postgresql image
#docker run -p 5432:5432 -e POSTGRES_PASSWORD=123456 -d postgres
# Here, -p 5433:5432 => local port is 5433 and image port is 5432
docker run -p 5433:5432 -e POSTGRES_PASSWORD=123456 -d postgres # work fine
docker start 2ddd98e4b7a5 # start docker container
psql -h localhost -p 5433 -U postgres # Enter this command local mechine pw: 123456

# Enter docker container
# docker exec -it <PSQL-Container-ID> bash
docker exec -it 940db6c513c9  bash
docker exec -it e99c67b72497 ls /etc/
docker exec -it e99c67b72497 ls /bin/
docker exec -it e99c67b72497 ls /

# connect with postgresql server
psql -h 0.0.0.0 -p 5432 -U postgres
# with pw
psql -h 0.0.0.0 -p 5432 -U postgres -W

# make pgadmin4 image
docker run --rm -p 5050:5050 thajeztah/pgadmin4

# exit from docker
exit


# docker postgis install
docker run -d --name postgis_postgres -e POSTGRES_PASSWORD=123456 -e POSTGRES_USER=postgres  -v /home/my_pc/Documents/postgres/db-data/:/var/lib/postgresql/data  -p 4000:4000  kartoza/postgis:9.6-2.4

docker exec -it postgis_postgres bash
psql -h localhost -p 5432 -U postgres

CREATE DATABASE oditiya_v2;
\c oditiya_v2
CREATE EXTENSION pg_trgm;
CREATE EXTENSION postgis;
CREATE EXTENSION postgis_topology;

CREATE EXTENSION IF NOT EXISTS postgis;
CREATE EXTENSION IF NOT EXISTS postgis_topology;
CREATE EXTENSION IF NOT EXISTS fuzzystrmatch;
CREATE EXTENSION IF NOT EXISTS postgis_tiger_geocoder;
CREATE EXTENSION IF NOT EXISTS postgis_raster;




# https://dev.to/alastairmeasures/dockerizing-phoenix-development-step-3-postgresql-postgis-ld1
# postgis using docker-compose
docker-compose  up  -d # run container
docker-compose logs -f
docker-compose  down # shutdown

#using container id 
docker start 59ed416c4fc7

# usig normal
docker exec -it 59ed416c4fc7 bash

# using root
docker exec -it 0f0c6b45ba7e /bin/ash
psql -h localhost -d postgres -U postgres
psql -h 0.0.0.0 -p 5432 -U postgres



