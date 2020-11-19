FROM python:3.9-slim

RUN apt-get -qq update && \
    apt-get -qq -y install --no-install-recommends ffmpeg=7:4.1.6* gcc=4:8.3.0* && \
    apt-get autoclean && \
    rm -rf /var/lib/apt/lists/*

COPY ./ /app/
WORKDIR /app
RUN pip3 install -r requirements.txt

ENTRYPOINT ["python3", "/app/main.py", "--config", "/app/config/config.ini"]
