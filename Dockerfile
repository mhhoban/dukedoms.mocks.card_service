FROM python:3.6.5-alpine3.7

COPY ./dist/dukedomsmockscardservice-0.0.0.tar.gz /dukedomsmockscardservice.tar.gz
RUN pip3 install /dukedomsmockscardservice.tar.gz

CMD ["python", "/usr/local/lib/python3.6/site-packages/dukedoms_mock_card_service/mock_card_service.py"]
