# Use an official Maven image as a build environment
FROM maven:3.8.4-openjdk-17 AS build

# Set the working directory in the container
WORKDIR /app

# Copy the project files into the container
COPY . .

# Compile the project
RUN mvn clean package -DskipTests

# Use an official OpenJDK runtime as a parent image
FROM openjdk:17

# Set the working directory in the container
WORKDIR /app

# Copy the JAR file from the build stage and rename it to app.jar
COPY --from=build /app/target/*.jar /app/app.jar

# Expose the port that your Spring Boot application will run on
EXPOSE 9091

# Define any environment variables if necessary
# ENV VARIABLE_NAME value

# Command to run the application
CMD ["java", "-jar", "app.jar"]
