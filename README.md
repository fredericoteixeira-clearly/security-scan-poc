docker build -t security-scan-poc .

docker run -p 49160:8080 -d security-scan-poc
