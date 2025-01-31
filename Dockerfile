# Use an official OpenJDK image as a base image
FROM openjdk:17-jdk-slim

# Create a user and group to run the app
RUN groupadd -r appgroup && useradd -r -g appgroup appuser

# Set the working directory inside the container
WORKDIR /app

# Copy the JAR file from the host to the container
COPY  helloworld/target/helloworld-1.1.jar /app/your-application.jar

# Change ownership of the JAR file to the appuser
RUN chown appuser:appgroup /app/your-application.jar

# Switch to the non-root user
USER appuser

# Expose port 8080 (or your application's port)
EXPOSE 8080

# Command to run the JAR file
CMD ["java", "-jar", "your-application.jar"]

