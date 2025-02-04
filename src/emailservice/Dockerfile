# Copyright 2020 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

FROM python:3.7-slim as base

FROM base as builder

RUN apt-get -qq update \
    && apt-get install -y --no-install-recommends \
        g++ \
    && rm -rf /var/lib/apt/lists/*

# get packages
COPY requirements.txt .
RUN pip install -r requirements.txt
RUN pip install opentelemetry-instrumentation
RUN pip install opentelemetry-instrumentation-grpc
RUN pip install opentelemetry-exporter-zipkin

#RUN pip install hypertrace-agent
#RUN pip install flask
#RUN pip install mysql-connector-python

FROM base as final
# Enable unbuffered logging
ENV PYTHONUNBUFFERED=1
# Enable Profiler
ENV ENABLE_PROFILER=1

#ENV HT_REPORTING_TRACE_REPORTER_TYPE=zipkin
#ENV HT_REPORTING_ENDPOINT=http://192.168.1.40:9411/api/v2/spans
#ENV HT_SERVICE_NAME=email
#ENV HT_ENABLE_CONSOLE_SPAN_EXPORTER=True
#ENV HT_LOG_LEVEL=DEBUG


RUN apt-get -qq update \
    && apt-get install -y --no-install-recommends \
        wget

# Download the grpc health probe
RUN GRPC_HEALTH_PROBE_VERSION=v0.3.6 && \
    wget -qO/bin/grpc_health_probe https://github.com/grpc-ecosystem/grpc-health-probe/releases/download/${GRPC_HEALTH_PROBE_VERSION}/grpc_health_probe-linux-amd64 && \
    chmod +x /bin/grpc_health_probe

WORKDIR /email_server

# Grab packages from builder
COPY --from=builder /usr/local/lib/python3.7/ /usr/local/lib/python3.7/
COPY --from=builder /usr/local/bin/opentelemetry-instrument /usr/local/bin/opentelemetry-instrument

# Add the application
COPY . .

ENV OTEL_TRACES_EXPORTER=zipkin_json
ENV OTEL_EXPORTER_OTLP_ENDPOINT="http://192.168.1.40:9411/api/v2/spans"
ENV OTEL_RESOURCE_ATTRIBUTES="service.name=email-service"
EXPOSE 8080
ENTRYPOINT [ "/usr/local/bin/opentelemetry-instrument", "python", "email_server.py" ]
