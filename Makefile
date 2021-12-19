BINARY=gotsmart
# VERSION_TAG=`git describe 2>/dev/null | cut -f 1 -d '-' 2>/dev/null`
$(eval VERSION_TAG = $(shell git describe 2>/dev/null | cut -f 1 -d '-' 2>/dev/null))

# If no git tag is set, fallback to 'DEVELOPMENT'
ifeq ($(strip ${VERSION_TAG}),)
  VERSION_TAG := "DEVELOPMENT"
endif

COMMIT_HASH=`git rev-parse --short=8 HEAD 2>/dev/null`
BUILD_TIME=`date +%FT%T%z`
LDFLAGS=-ldflags "-s -w \
	-X github.com/egbertp/gotsmart/conf.BuildTime=${BUILD_TIME} \
	-X github.com/egbertp/gotsmart/conf.VersionTag=${VERSION_TAG}"

all: build linux darwin armv6 armv7 arm64

clean:
	go clean
	if [ -f ${BINARY} ] ; then rm ${BINARY} ; fi

release: clean linux darwin

# Installs our project: copies binaries
install:
	go install ${LDFLAGS}

build:
	if [ -f ${BINARY} ] ; then rm ${BINARY} ; fi
	go build -o ./target/linux_amd64/${BINARY} ${LDFLAGS} .

linux:
	GOOS=linux GOARCH=amd64 go build -o ./target/linux_amd64/${BINARY} ${LDFLAGS} .

darwin:
	GOOS=darwin GOARCH=amd64 go build -o ./target/darwin_amd64/${BINARY} ${LDFLAGS} .

armv6:
	GOOS=linux GOARCH=arm GOARM=6 go build -o ./target/linux_armv6/${BINARY} ${LDFLAGS} .

armv7:
	GOOS=linux GOARCH=arm GOARM=7 go build -o ./target/linux_armv7/${BINARY} ${LDFLAGS} .

arm64:
	GOOS=linux GOARCH=arm64 go build -o ./target/linux_arm64/${BINARY} ${LDFLAGS} .