# Use the official Python image from Docker Hub
FROM python:3.9-slim

# Set working directory
WORKDIR /app

# Copy requirements and install them
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the app code
COPY app/ ./app/

# Expose port
EXPOSE 5000

# Command to run the app
CMD ["python", "app/app.py"]
