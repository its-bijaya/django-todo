# Use the official Python image from Docker Hub
FROM python:3

# Install Django 3.2 using pip
RUN pip install django==3.2

WORKDIR /app

# Copy the current directory contents into the container at / (root of the app)
COPY . .

# Run Django migrations to set up the database
RUN python manage.py migrate

# Expose port 8000 to allow communication to/from the Docker container
EXPOSE 8000

# Specify the command to run when the container starts
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
