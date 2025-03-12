# Use an official Alpine-based Python image
FROM python:3.12-alpine

# Set the working directory
WORKDIR /app

# Install required system dependencies
RUN apk add --no-cache libreoffice 

# Copy application files
COPY . .

# Create and activate a virtual environment
RUN python -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

# Install dependencies inside the virtual environment
RUN pip install --no-cache-dir -r requirements.txt

# Switch to a non-root user
USER devseccpt

# Ensure working directory remains consistent
WORKDIR /app

# Set entrypoint and default command
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["sh", "-c", "[ -f convert.py ] && python convert.py"]
