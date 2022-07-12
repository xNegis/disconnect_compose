FROM python:3.8-slim-buster
WORKDIR /
COPY disconnecter.py .
COPY disconnecter.config .
COPY docker-compose.override.yml .
COPY requirements.txt .
RUN pip install -r requirements.txt
ENTRYPOINT python ./disconnecter.py 