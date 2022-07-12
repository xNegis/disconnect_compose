FROM python:3.8-slim-buster
WORKDIR /
COPY requirements.txt .
RUN pip install -r requirements.txt
CMD cd src && python disconnecter.py
