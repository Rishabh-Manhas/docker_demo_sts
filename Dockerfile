FROM python:3.10-slim

RUN useradd -m myuser

WORKDIR /app

COPY . .

RUN pip install Flask

RUN chown -R myuser:myuser /app

USER myuser

EXPOSE 8000

CMD ["python", "server.py"]
