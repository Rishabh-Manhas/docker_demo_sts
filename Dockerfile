FROM python:3.10-slim

# Create non-root user
RUN useradd -m myuser

WORKDIR /app

COPY requirements.txt app.py ./

# Install dependencies early (Docker caching)
RUN pip install --no-cache-dir -r requirements.txt

RUN chown -R myuser:myuser /app

# Switch to non-root user
USER myuser

EXPOSE 8000

#Start the Flask app
CMD ["python", "server.py"]
