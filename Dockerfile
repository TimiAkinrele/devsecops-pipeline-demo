# Use the official Python image from Docker Hub
FROM python:3.9-slim

# Create a non-root user with a home directory
RUN useradd -m appuser

# Set the working directory
WORKDIR /app

# Copy requirements and install them
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the application code and adjust ownership
COPY --chown=appuser:appuser . .

# Switch to the non-root user
USER appuser

# Expose the application port
EXPOSE 5000

# Command to run the application
CMD ["python", "app/app.py"]
