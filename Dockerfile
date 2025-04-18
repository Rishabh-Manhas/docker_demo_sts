FROM python:3.10-slim

RUN useradd -m myuser

WORKDIR /app

COPY requirements.txt app.py ./

RUN pip install --no-cache-dir -r requirements.txt

RUN chown -R myuser:myuser /app

USER myuser

EXPOSE 8000

CMD ["python", "server.py"]
