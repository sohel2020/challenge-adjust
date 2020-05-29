 # Challange 02

## Considerable facts      
    
- SSL terminalion are more CPU intensive task.
- Basically this proxy server will handle large ammount of TCP connections and network traffic.
- what kind of encryption algorithm will be used? based on it CPU Performance will be affected.
- What are that average session time?
- Linux Kernel parameter tuning for network and file descriptor.

## Possible Proxy Configuration
    
- Nginx is a lightweight web proxy server. It can handle large number of request. we we need to customize nginx configuration as per our need.
- we can use session_reuse to save full SSL handshake.
- we should use ssl_session_cache directive along with ssl_session_timeout. so it'll distribute session cache between worker.
- we should use workers to distribute the tasks between processors.
- we should use ssl_handshake_timeout. Inital SSL handshake is CPU intensive.


## Linux Command to help Troubleshooting

- top - command shows and overview with, memory, swap, process, load average.
- iostat - Command line that shows input and output data to local disk utilization and memory/swap
- netstat - shows a different of network connections like active, establishedand wait connections
- ifstat - Show network interface status for network traffic


## Importance Metrics to monitor
    
- CPU throttling, load average
- How many TCP connection are open and failing
- Available RAM
- Disk I/O
- Network Bandwidth utilization
- NGINX Active Connection, Waiting connection
- NGINX  total number of successful SSL handshakes, total number of failed SSL handshakes, 
Total number of session reuses during SSL handshake.


## How I'll gather those metics?
    
- I need to enable nginx status module.
- I'll use prometheus **nginx exporter** to collect above metrics.
- To collect server metrics (Network, disk I/O, CPU, memory) I'll use Prometheus **node_exporter**.
- Once I've gathered all metrics then I can create **grafana dashboard** and **alerting** based on those metrics.


## Why Prometheus Monitoring?
Prometheus is a pull based monitoring that supports a large number of exporter and we can write our own exporter if we need. It provides a standardized way for gathering metrics.

## Benchmark Tools
- we an use a tools like "wrk" to simulate real world scenario. e.g: `wrk -t12 -c2500 -d30s http://127.0.0.1/index.html`

## challenge for monitoring?
Monitoring Backend connection timeout is hard. For this we a write a custom exporter promethues or we can send our log to Elasticsearch and build a connection timeout dashboard from there.





