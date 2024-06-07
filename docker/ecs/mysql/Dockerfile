# syntax=docker/dockerfile:1
FROM public.ecr.aws/docker/library/mysql:oraclelinux8


# Set environment variables
ENV MYSQL_ROOT_PASSWORD=my_secret_password
ENV MYSQL_USER=huyngo
ENV MYSQL_PASSWORD=secret
ENV MYSQL_DATABASE=exam_db

# Optionally create a new MySQL user and grant privileges
# ENV MYSQL_USER=my_user
# ENV MYSQL_PASSWORD=my_user_password
# ENV MYSQL_DATABASE=my_database
# RUN mysql -u root -p"$MYSQL_ROOT_PASSWORD" -e "CREATE USER '$MYSQL_USER' IDENTIFIED BY '$MYSQL_PASSWORD';"
# RUN mysql -u root -p"$MYSQL_ROOT_PASSWORD" -e "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%';"

# Expose port if needed
EXPOSE 3306

# Optionally, copy SQL files to initialize the database
COPY ./docker/ecs/mysql/setup.sql /docker-entrypoint-initdb.d/setup.sql
COPY ./docker/ecs/mysql/my.cnf /etc/mysql/my.cnf

# Start MySQL service
CMD ["mysqld"]
