# Raspberry Pi Zero 2 W (2021)

Download `Raspberry Pi OS Lite` from the [official Raspberry Pi download page](https://www.raspberrypi.com/software/operating-systems/). At the time of writing:

|                |                                                                  |
| -------------- | ---------------------------------------------------------------- |
| Release date   | October 30th 2021                                                |
| Kernel version | 5.10                                                             |
| SHA256         | 008d7377b8c8b853a6663448a3f7688ba98e2805949127a1d9e8859ff96ee1a9 |
| Distributor ID | Raspbian                                                         |
| Description    | Raspbian GNU/Linux 11 (bullseye)                                 |
| Release        | 11                                                               |
| Codename       | bullseye                                                         |
| Architecture   | armv7l                                                           |

```sh
$ curl -L -O https://downloads.raspberrypi.org/raspios_lite_armhf/images/raspios_lite_armhf-2021-11-08/2021-10-30-raspios-bullseye-armhf-lite.zip
```

Write `Raspberry Pi OS Lite` to your SD card using [`Raspberry Pi Imager`](https://www.raspberrypi.com/software/)

Put the SD card in your `Raspberry Pi Zero 2 W`, connect the HDMI cable and connect your keyboard, then power on the device

Configure the device

```
$ raspi-config
```

```
Raspberry Pi Zero 2 Rev 1.0

┌──────────────┤ Raspberry Pi Software Configuration Tool (raspi-config) ├───────────────┐
│                                                                                        │
│            1 System Options       Configure system settings                            │
│            2 Display Options      Configure display settings                           │
│            3 Interface Options    Configure connections to peripherals                 │
│            4 Performance Options  Configure performance settings                       │
│            5 Localisation Options Configure language and regional settings             │
│            6 Advanced Options     Configure advanced settings                          │
│            8 Update               Update this tool to the latest version               │
│            9 About raspi-config   Information about this configuration tool            │
│                                                                                        │
│                                                                                        │
│                                                                                        │
│                                                                                        │
│                                                                                        │
│                        <Select>                        <Finish>                        │
│                                                                                        │
└────────────────────────────────────────────────────────────────────────────────────────┘
```

1. Set the legal wireless channels for your country: Go to `5` => `L4 WLAN Country`
2. Configure your wireless network: Go to `1` => `S1 Wireless LAN`
3. Set the hostname: Go to `1` => `S4 Hostname`
4. Change the default password for the `pi` user: Go to `1` => `S3 Password`
5. Wait for network connection on boot: Go to `1` => `S6 Network at Boot`
6. Configure the timezone you're in: Go to `5` => `L2 Timezone`

Now configure your `Raspberry Pi Zero 2 W (2021)` to read data from the `P1 port` as described in the [`README.md` file](./README.md)

When everything is configured the way you want, then enable read-only filesystem, which is called `Overlay File System`

7. Enable `Overlay File System`: Go to `4` => `P3`

```

               ┌──────────────────────────────────────────────────────────┐
               │                                                          │
               │ Would you like the overlay file system to be enabled?    │
               │                                                          │
               │                                                          │
               │                                                          │
               │                                                          │
               │                                                          │
               │                                                          │
               │                                                          │
               │                                                          │
               │                                                          │
               │                                                          │
               │                                                          │
               │                                                          │
               │                                                          │
               │                                                          │
               │               <Yes>                  <No>                │
               │                                                          │
               └──────────────────────────────────────────────────────────┘
```

```

               ┌──────────────────────────────────────────────────────────┐
               │                                                          │
               │ The overlay file system is enabled.                      │
               │                                                          │
               │                                                          │
               │                                                          │
               │                                                          │
               │                                                          │
               │                                                          │
               │                                                          │
               │                                                          │
               │                                                          │
               │                                                          │
               │                                                          │
               │                                                          │
               │                                                          │
               │                                                          │
               │                          <Ok>                            │
               │                                                          │
               └──────────────────────────────────────────────────────────┘
```

```

               ┌──────────────────────────────────────────────────────────┐
               │                                                          │
               │ Would you like the boot partition to be write-protected? │
               │                                                          │
               │                                                          │
               │                                                          │
               │                                                          │
               │                                                          │
               │                                                          │
               │                                                          │
               │                                                          │
               │                                                          │
               │                                                          │
               │                                                          │
               │                                                          │
               │                                                          │
               │                                                          │
               │               <Yes>                  <No>                │
               │                                                          │
               └──────────────────────────────────────────────────────────┘
```

```

               ┌──────────────────────────────────────────────────────────┐
               │                                                          │
               │ The boot partition is writable.                          │
               │                                                          │
               │                                                          │
               │                                                          │
               │                                                          │
               │                                                          │
               │                                                          │
               │                                                          │
               │                                                          │
               │                                                          │
               │                                                          │
               │                                                          │
               │                                                          │
               │                                                          │
               │                                                          │
               │                          <Ok>                            │
               │                                                          │
               └──────────────────────────────────────────────────────────┘
```

Select `Finish` and reboot your Pi
