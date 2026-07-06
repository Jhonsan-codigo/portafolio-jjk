FROM tomcat:10.1-jdk17

# Instalar Maven
RUN apt-get update && apt-get install -y maven

# Descargar driver PostgreSQL directamente
RUN apt-get install -y wget && \
    wget https://jdbc.postgresql.org/download/postgresql-42.7.1.jar -O /usr/local/tomcat/lib/postgresql-42.7.1.jar

# Copiar todo el código fuente
COPY . /app
WORKDIR /app

# Compilar el proyecto con Maven
RUN mvn clean package -DskipTests

# Copiar el WAR generado a Tomcat
RUN cp target/*.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080
CMD ["catalina.sh", "run"]