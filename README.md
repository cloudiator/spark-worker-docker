# Apache Spark Worker Docker Container

Based on the latest release of [Apache Spark](http://spark.apache.org/)

Current release: Spark 2.3.1 with Hadoop 2.7 

------

### Configuration

Required environment variables:

- SPARK_MASTER_ENDPOINT => Spark Master IP
- SPARK_MASTER_PORT => Spark Master PORT
- SPARK_WORKER_UI_PORT => Spark Worker Web Interface

Default configuration options:

- SPARK_WORKER_PORT=9999 => static configurations for all Spark Workers

Optional configuration options to report to JMS:

- JMS_IP => JMS IP for the Metric Agent

- JMS_PORT => JMS PORT for the Metric Agent

- APP_NAME => name of the application to monitor

- JMS_USER => username to authenticate against the JMS to report metrics

- JMS_PASSWORD => password to authenticate against the JMS to report metrics

------

### Usage:

```dockerfile
docker run -d -e SPARK_MASTER_ENDPOINT=1.2.3.4 -e SPARK_MASTER_PORT=7077 -e SPARK_WORKER_UI_PORT=8081 -p 9999:9999 -p 8081:8081   cloudiator/spark-worker:latest
```

