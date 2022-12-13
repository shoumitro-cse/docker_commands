# pull official base image
FROM java:8
EXPOSE 8080
ADD target/my_spring.jar my_spring.jar
ENTRYPOINT ["java", "-jar", "my_spring.jar"]
