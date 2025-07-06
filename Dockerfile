FROM python:3.13.4-alpine3.22

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed packages specified in requirements.txt
# First, create a dummy requirements.txt if it doesn't exist, to avoid COPY errors for the next step.
# In a real project, you'd have a requirements.txt file with all dependencies.
RUN pip install --no-cache-dir -r requirements.txt

# Expose port 8000 for the FastAPI application
EXPOSE 8000

# Run the application using Uvicorn
# You might need to install uvicorn and any other direct dependencies in your requirements.txt
# For example: uvicorn[standard], sqlalchemy, pydantic, etc.
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]