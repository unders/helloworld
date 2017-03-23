package main

import (
	"flag"
	"fmt"
	"io"
	"net/http"
	"os"
	"os/signal"
	"syscall"
)

var (
	// Version the version of the prog.
	Version = "No Version Provided"

	// Buildstamp the time the prog was built.
	Buildstamp = "No Buildstamp provided"

	// Githash the git commit hash
	Githash = "No Githash provided"
)

// default address for the server
var addr = "0.0.0.0:80"

// reply message
const (
	reply = "Hello world"
)

// log messages
const (
	started          = "info=started app=helloworld"
	release          = "info=version:%s buildstamp:%s githash:%s app=helloworld\n"
	stopped          = "info=stopped app=helloworld"
	stoppedWithError = "err=%s app=helloworld\n"
	running          = "info=listens on address %s app=helloworld\n"
	gotStopSignal    = "\ninfo=got signal %s app=helloworld\n"
	calledFrom       = "info=handler called from %s app=helloworld\n"
	writeError       = "err=%s app=helloworld\n"
)

func main() {
	if ok := run(os.Args, os.Stdout); !ok {
		os.Exit(1)
	}
}

func run(args []string, log io.Writer) bool {
	fmt.Fprintln(log, started)
	fmt.Fprintf(log, release, Version, Buildstamp, Githash)
	addr = parseAddress(args)

	http.HandleFunc("/", helloWorld(log))

	ch := make(chan error, 1)
	go func() {
		if err := http.ListenAndServe(addr, nil); err != nil {
			ch <- err
		}
		close(ch)
	}()

	fmt.Fprintf(log, running, addr)

	select {
	case err := <-ch:
		fmt.Fprintf(log, stoppedWithError, err)
		fmt.Fprintln(log, stopped)
		return false
	case sig := <-wait():
		fmt.Fprintf(log, gotStopSignal, sig)
		fmt.Fprintln(log, stopped)
		return true
	}
}

func helloWorld(log io.Writer) func(w http.ResponseWriter, r *http.Request) {
	return func(w http.ResponseWriter, r *http.Request) {

		fmt.Fprintf(log, calledFrom, r.RemoteAddr)

		if _, err := fmt.Fprintln(w, reply); err != nil {
			fmt.Fprintf(log, writeError, err)
		}
	}
}

func parseAddress(args []string) string {
	var (
		httpAddr = flag.String("http", "0.0.0.0:80", "HTTP service address.")
		// healthAddr = flag.String("health", "0.0.0.0:81", "Health service address.")
	)
	flag.Parse()
	return *httpAddr
}

// waits returns an os.Signal chan that waits for these signals:
//
//      * SIGTERM   - request for termination (process can release its resources).
//      * SIGINT    - sent from terminal when it wishes to interrupt the process.
//
// Usage:
//
//       sig := <-wait()
//
func wait() chan os.Signal {
	interrupt := make(chan os.Signal, 2)
	signal.Notify(interrupt,
		syscall.SIGTERM,
		syscall.SIGINT)

	return interrupt
}
