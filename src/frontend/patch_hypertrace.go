package main

import (
	"net/http"
)

type HyperTracePatchHandler struct {
	InnerHandler http.Handler
}

func (handler HyperTracePatchHandler) ServeHTTP(rw http.ResponseWriter, r *http.Request) {
	handler.InnerHandler.ServeHTTP(rw, r)

	// This will NOT get to the browser - however - this will trick HyperTrace into sending the response body.
	// See https://github.com/hypertrace/goagent/blob/f55fc74f47cc8dd9a30395c7be1c9b8ee5e7fb75/sdk/instrumentation/net/http/contenttype.go#L8
	rw.Header().Set("Content-Type", "application/json")
}

func HyperTracePatchMiddleware(handler http.Handler) http.Handler {
	return HyperTracePatchHandler{handler}
}
