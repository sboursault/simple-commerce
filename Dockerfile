#
# Build stage
#
FROM nikolaik/python-nodejs:python3.8-nodejs18
ENV PYTHONUNBUFFERED 1
COPY ./requirements.txt /requirements.txt
RUN pip3 install -r /requirements.txt
COPY . /app
WORKDIR /app
RUN make install
RUN make build_sandbox \
  && rm -rf node_modules \
  && find . -name "*.gz" -type f -delete
RUN cp --remove-destination /app/src/oscar/static/oscar/img/image_not_found.jpg /app/sandbox/public/media/


#
# Package stage
#
FROM python:3.8-slim
COPY --from=0 /usr/local/lib/python3.8/site-packages*/ /usr/local/lib/python3.8/site-packages/
COPY --from=0 /app/ /app/
WORKDIR /app
CMD ["sandbox/manage.py", "runserver", "0.0.0.0:8000"]
# `0.0.0.0:8000` is required when running in docker

