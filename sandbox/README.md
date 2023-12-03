# Simple-commerce

## How to run simple-commerce

### From the source code
    
    virtualenv --python=python3 venv  
    source ./oscar/bin/activate
    make sandbox
    sandbox/manage.py runserver

(source: https://docs.oscarcommerce.com/en/latest/internals/sandbox.html)

### Using the docker image

	docker run -p 8000:8000 sboursault/simple-commerce:1.0

### Build and push the docker image

    docker build -t sboursault/simple-commerce:1.0 --rm=true --no-cache=true .
    docker push sboursault/simple-commerce:1.0


