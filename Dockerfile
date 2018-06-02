FROM python:3.6.5-alpine3.7

COPY requirements.txt /

RUN pip3 install -r /requirements.txt

COPY utility_scripts/wait-for-it.sh /
COPY setup.py /setup.py

ARG service
COPY $service/ /$service

RUN pip3 install -e .

ARG service
WORKDIR /$service


CMD ["gunicorn", "mock_card_service:application", "-b", "0.0.0.0:8080"]
