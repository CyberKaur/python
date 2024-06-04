# Dockerfile
FROM python:3.9-slim

# Install dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    python3-dev \
    python3-pip \
    && pip install pyinstaller

# Copy the web server script
COPY web_server.py /app/web_server.py

# Set the working directory
WORKDIR /app

# Create the executable
RUN pyinstaller --onefile web_server.py

# Expose the port
EXPOSE 8000

# Command to run the executable
CMD ["./dist/web_server"]
