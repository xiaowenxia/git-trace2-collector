## agit-trace2-collector

agit 把 trace2 数据推送到[阿里云SLS Trace服务](https://sls.console.aliyun.com/lognext/trace)上。


### 编译
```sh
$ make
```

### 配置文件

示例：
```yaml
receivers:
  trace2receiver:
    socket: "/usr/local/my-collector/trace2.socket"
exporters:
  logging:
    verbosity: detailed   # basic, normal, detailed
  alibabacloud_logservice/traces:
    # LogService's Endpoint
    endpoint: "cn-hangzhou.log.aliyuncs.com"
    # LogService's Project Name
    project: ""
    # LogService's Logstore Name
    logstore: ""
    # AlibabaCloud access key id
    access_key_id: ""
    # AlibabaCloud access key secret
    access_key_secret: ""
service:
  telemetry:
    logs:
      level: "DEBUG"     # "INFO", "DEBUG"
  pipelines:
    traces:
      receivers: [trace2receiver]
      processors: []
      exporters: [logging, alibabacloud_logservice/traces]

```

### 运行

```sh
$ ./agit-trace2-collector --config=<config-file>
```