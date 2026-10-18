# Use the official Python image from the Docker Hub
FROM python:3.9-slim

# Set the working directory
WORKDIR /app

# Copy the requirements file into the container
COPY requirements.txt .

# Install the dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code
COPY . .

# Create a non-root user and switch to it for security
RUN useradd --uid 1000 appuser && chown -R appuser /app
USER appuser

# Expose port 8080
EXPOSE 8080

# Run the service using gunicorn as specified in the course
CMD ["gunicorn", "--bind=0.0.0.0:8080", "--log-level=info", "service:app"]