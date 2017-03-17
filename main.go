package main

import (
	"fmt"
	"net/http"
	"os"
	"os/signal"
	"syscall"
)

var addr = "localhost:8080"

func main() {
	fmt.Printf("\ninfo=helloworld started\n")
	addr = parseAddress(os.Args)

	http.HandleFunc("/", helloWorld)

	ch := make(chan error, 1)
	go func() {
		if err := http.ListenAndServe(addr, nil); err != nil {
			ch <- err
		}
		close(ch)
	}()

	fmt.Printf("info=listens on address %s\n", addr)

	select {
	case err := <-ch:
		fmt.Println("err=server stopped with error:", err)
	case sig := <-wait():
		fmt.Printf("\ninfo=got signal %s\n", sig)
	}

	fmt.Println("info=helloworld stopped\n")
}

func helloWorld(w http.ResponseWriter, r *http.Request) {
	fmt.Printf("info=helloworld handler called from %s\n", r.RemoteAddr)
	if _, err := fmt.Fprintln(w, "Hello world"); err != nil {
		fmt.Println("err=helloworld handler write error", err)
	}
}

func parseAddress(args []string) string {
	if len(args) == 1 {
		return addr
	}

	return args[1]
}

// Interrupt returns an os.Signal chan that waits for these signals:
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
