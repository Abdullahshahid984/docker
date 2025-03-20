# Use an official Alpine-based Python image
FROM python:3.12-alpine

# Set the working directory
WORKDIR /app

# Install required system dependencies and clean up
RUN apk add --no-cache \
    libreoffice \
    libreoffice-common \
    libreoffice-writer \
    openjdk17-jre \
    && rm -rf /var/cache/apk/*

# Create and activate a virtual environment
RUN python -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

# Install dependencies inside the virtual environment
COPY requirements.txt .
RUN pip install --no-cache-dir --upgrade pip && pip install --no-cache-dir -r requirements.txt

# Copy application files
COPY . .

# Create a non-root user & switch
RUN addgroup -S appgroup && adduser -S devseccpt -G appgroup
USER devseccpt

# Set entrypoint and default command
ENTRYPOINT ["sh", "-c"]
CMD ["if [ -f convert.py ]; then python convert.py; else echo '❌ convert.py not found'; fi"]
