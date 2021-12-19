# GotSmart

[![workflow](https://github.com/egbertp/gotsmart/workflows/goreleaser/badge.svg)](https://github.com/egbertp/gotsmart/releases)

GotSmart collects information from the Dutch Slimme Meter (translated as Smart Meter) and exports them as Prometheus metrics.
For extensive details on the metrics see the [docs from Netbeheer Nederland](https://www.netbeheernederland.nl/_upload/Files/Slimme_meter_15_a727fce1f1.pdf)

This project is forked from Harry Metske [`gotsmart`](https://github.com/metskem/gotsmart). Harry forked the project from [Bas Roovers](https://github.com/basroovers) and Bas forked from [Bas van der Lei](https://github.com/basvdlei/gotsmart). Thanks to Harry, Bas and Bas!

I upgraded to `go1.17` and am using go modules. I've configured a release pipeline that creates binaries for more platforms and architectures (amongst others FreeBSD).

## Setup

### Build

```sh
cd gotsmart
go mod tidy
make
```

### Run

Specify the serial device that is connected with the Smart Meter, and a non-default listen address:port.

```sh
gotsmart -device /dev/ttyS0 -listen-address :8082
```

If you want to run it as a daemon, use the file `/etc/systemd/system/gotsmart.service` and fill it with this (example, fixed port and device):

```sh
[Unit]
Description=GotSmart, reading your smart meter and providing a prometheus exporter endpoint
Documentation=https://github.com/egbertp/gotsmart
After=network-online.target

[Service]
User=pi
Restart=on-failure

ExecStart=/usr/local/bin/gotsmart -listen-address :8082 -device /dev/ttyUSB0

[Install]
WantedBy=multi-user.target
```

Then enable and start the service

```sh
$ systemctl enable gotsmart.service
$ systemctl start gotsmart.service
```

## Usage

By default gotsmart reads device /dev/ttyAMA0, listens on address:port 0.0.0.0:8080 and exposes the metrics under `/metrics`.

## Docker container

```sh
$ docker build -t poteb/gotsmart .

$ docker images

docker images
REPOSITORY         TAG       IMAGE ID       CREATED         SIZE
poteb/gotsmart     latest    30754165bf37   8 seconds ago   11.5MB
```

## Hardware

|                                           | instructions / remarks                                | supplier                                                                                                                        | cost        |
| ----------------------------------------- | ----------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------- | ----------- |
| Raspberry Pi Zero 2 W (2021)              | [configuration instructions](Raspberry-Pi-Zero2-W.md) | [Raspberry Store](https://www.raspberrystore.nl/PrestaShop/raspberry-pi-zero-2/373-raspberry-pi-zero-2-2021-5056561800004.html) | € 18,95     |
| Zero Essentials Kit                       | N/A                                                   | [Raspberry Store](https://www.raspberrystore.nl/PrestaShop/raspberry-pi-zero-2/379-zero-essentials-kit.html)                    | € 6,95      |
| Power adapter (T6716DV)                   | N/A                                                   | [Raspberry Store](https://www.raspberrystore.nl/PrestaShop/raspberry-pi-v3-b-2018/248-micro-usb-stroomadapter-pi3.html)         | € 9,95      |
| Slimme Meter Kabel - 1.8 Meter (P1 kabel) | N/A                                                   | [SOS Solutions](https://www.sossolutions.nl/slimme-meter-kabel)                                                                 | € 19,95     |
|                                           |                                                       | **Total without case**                                                                                                          | **€ 55,80** |
| FLIRC Raspberry Pi Zero Behuizing         | N/A                                                   | [SOS Solutions](https://www.sossolutions.nl/flirc-raspberry-pi-zero-behuizing)                                                  | € 12,95     |
|                                           |                                                       | **Total with case**                                                                                                             | **€ 68,75** |
