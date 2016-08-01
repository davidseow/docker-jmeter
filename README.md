# docker-jmeter

Packages JMeter in a docker container

## Example usage

```bash
docker run -i -t --rm -v $(pwd):/root davidseow/jmeter bin/jmeter -n -t ./<jmeter_file>.jmx