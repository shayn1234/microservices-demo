module github.com/GoogleCloudPlatform/microservices-demo/src/checkoutservice

go 1.16

require (
	cloud.google.com/go/profiler v0.1.0
	cloud.google.com/go/trace v0.1.0 // indirect
	contrib.go.opencensus.io/exporter/jaeger v0.2.1
	contrib.go.opencensus.io/exporter/stackdriver v0.13.8
	github.com/golang/protobuf v1.5.2
	github.com/google/uuid v1.3.0
	github.com/hypertrace/goagent v0.4.0
	github.com/sirupsen/logrus v1.8.1
	go.opencensus.io v0.23.0
	golang.org/x/net v0.0.0-20210908191846-a5e095526f91
	google.golang.org/grpc v1.40.0
	google.golang.org/protobuf v1.27.1
)
