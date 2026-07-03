FROM tomcat:10.1-jdk17

# Instalar Maven
RUN apt-get update && apt-get install -y maven

# Copiar todo el código fuente
COPY . /app
WORKDIR /app

# Compilar el proyecto con Maven
RUN mvn clean package -DskipTests

# Copiar el WAR generado a Tomcat
RUN cp target/*.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080
CMD ["catalina.sh", "run"]