# Backend Dockerfile
FROM python:3.10-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set working directory
WORKDIR /app

# Install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy Django project files
COPY . .

ENV PORT 8080

# Expose the Django development server port
EXPOSE 8080

# Run Django server
CMD ["sh", "-c", "python manage.py runserver 0.0.0.0:$PORT"]
