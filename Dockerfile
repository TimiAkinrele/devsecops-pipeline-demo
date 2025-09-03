# Use the official slim Python image
FROM python:3.9-slim

# Create a non-root user
RUN useradd -m appuser

# Set workdir
WORKDIR /app

# Install dependencies first (layer caching)
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy app code with correct ownership
COPY --chown=appuser:appuser . .

# Switch to non-root
USER appuser

# Expose port
EXPOSE 5000

# Run Flask app
CMD ["python", "app/app.py"]
