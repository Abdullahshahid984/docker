# Use an official Alpine-based Python image
FROM python:3.12-alpine

# Set the working directory
WORKDIR /app

# Install required system dependencies
RUN apk add --no-cache libreoffice libreoffice-common libreoffice-writer openjdk17-jre

# Create and activate a virtual environment
RUN python -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

# Install dependencies inside the virtual environment
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy application files
COPY . .

# Ensure /app directory has full permissions
RUN chmod -R 777 /app

# Run as root (commenting out non-root user)
# RUN adduser -D -u 1000 devseccpt
# USER devseccpt
USER root

# Debugging: Print LibreOffice version before running the command
CMD libreoffice --version && \
    sh -c "if [ -f convert.py ]; then python convert.py; else echo '❌ convert.py not found'; fi"
