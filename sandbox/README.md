Run simple commercer


https://docs.oscarcommerce.com/en/latest/internals/sandbox.html


docker build -t sboursault/simple-commerce:1.0 --rm=true --no-cache=true .
docker run -p 8000:8000  simple-commerce:1.0

docker push sboursault/simple-commerce:1.0


