# docker-jmeter

Packages JMeter 3.0 with JMeterPlugins-ExtrasLibs-1.4.0 in a docker container

## Example usage

```bash
docker run -i -t --rm -v $(pwd):/root davidseow/jmeter bin/jmeter -n -t ./<jmeter_file>.jmx