# docker-jmeter

Packages JMeter in a docker container

## Example usage

```bash
# build docker image
docker build -t ag-digital/docker-jmeter .

# run container
docker run --rm -v $(pwd)/test/healthcheck/scrAPI.jmx -v $(pwd)/test/healthcheck/scrAPI.jtl:/healthcheck/scrAPI.jtl ag-digital/docker-jmeter bin/jmeter -t /healthcheck/scrAPI.jmx -l /healthcheck/scrAPI.jtl
```
