# Use an official Alpine-based Python image
FROM python:3.12-alpine

# Set the working directory
WORKDIR /app

# Install required system dependencies
RUN apk add --no-cache libreoffice 

# Copy files
COPY . /app/

# Create and activate a virtual environment
RUN python -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

# Install dependencies inside the virtual environment
RUN pip install --no-cache-dir -r requirements.txt

# Default command
CMD ["sh", "-c", "if [ -f convert.py ]; then python convert.py; fi"]
