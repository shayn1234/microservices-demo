module github.com/GoogleCloudPlatform/microservices-demo/src/frontend

go 1.15

require (
	cloud.google.com/go/monitoring v0.1.0 // indirect
	cloud.google.com/go/profiler v0.1.0
	cloud.google.com/go/trace v0.1.0 // indirect
	contrib.go.opencensus.io/exporter/jaeger v0.2.0
	contrib.go.opencensus.io/exporter/stackdriver v0.5.0
	github.com/golang/protobuf v1.5.2
	github.com/google/uuid v1.1.2
	github.com/gorilla/mux v1.8.0
	github.com/hypertrace/goagent v0.3.0
	github.com/konsorten/go-windows-terminal-sequences v1.0.2 // indirect
	github.com/pkg/errors v0.9.1
	github.com/sirupsen/logrus v1.4.2
	github.com/uber/jaeger-client-go v2.21.1+incompatible // indirect
	go.opencensus.io v0.23.0
	golang.org/x/net v0.0.0-20210503060351-7fd8e65b6420
	google.golang.org/api v0.56.0 // indirect
	google.golang.org/genproto v0.0.0-20210903162649-d08c68adba83 // indirect
	google.golang.org/grpc v1.40.0
)

//replace google.golang.org/grpc v1.40.0 => google.golang.org/grpc v1.26.0
