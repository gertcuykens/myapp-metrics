install:
	go get -u github.com/prometheus/client_golang/prometheus
	go get github.com/prometheus/prometheus/cmd/...

myapp:
	go build; ./myapp-metrics

prometheus:
	prometheus --config.file="myapp-metrics.yml"

metrics:
	curl http://localhost:8080/metrics

graph:
	open http://localhost:9090

check:
	curl -s http://localhost:2112/metrics | promtool check metrics

.PHONY: install myapp prometheus metrics graph check
