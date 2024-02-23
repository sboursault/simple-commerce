#
# Build stage
#
FROM python:3.8
ENV PYTHONUNBUFFERED 1

RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -
RUN apt-get install -y nodejs npm

COPY ./requirements.txt /requirements.txt
RUN pip3 install -r /requirements.txt

# RUN groupadd -r django && useradd -r -g django django
COPY . /app
# RUN chown -R django /app

WORKDIR /app

RUN make install

# USER django

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

# consider using this repo fore node js
# https://deb.nodesource.com/setup_18.x — Node.js 18 LTS "Hydrogen" (recommended)
