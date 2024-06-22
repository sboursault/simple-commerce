# Simple-commerce

## How to run simple-commerce

### From the source code
    
    virtualenv --python=python3 venv  
    source ./venv/bin/activate
    make sandbox
    sandbox/manage.py runserver

(source: https://docs.oscarcommerce.com/en/latest/internals/sandbox.html)

### Using the docker image

	docker run -p 8000:8000 \
        -e CSRF_ENABLED='true' \
        sboursault/simple-commerce:1.2

### Build and push the docker image

    docker build -t sboursault/simple-commerce:1.2 --rm=true --no-cache=true .
    docker push sboursault/simple-commerce:1.2

Now the image url is 'docker.io/sboursault/simple-commerce:1.2'.
    
### Admin user

username: superuser
email: superuser@example.com
password: testing
