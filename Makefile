all: build

build:
	go build -o git-trace2-collector

clean:
	-rm -f git-trace2-collector