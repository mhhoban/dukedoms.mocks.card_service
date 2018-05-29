FROM python:3.6.5-alpine3.7

ARG mock_service_sdist
COPY ./dist/$mock_service_sdist /$mock_service_sdist

ARG mock_service_sdist
RUN pip3 install /$mock_service_sdist

CMD ["python", "/usr/local/lib/python3.6/site-packages/dukedoms_mock_card_service/mock_card_service.py"]
