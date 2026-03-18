# Build your redpesk OS image (aarch64) using mkosi

mkosi is a systemd tool that generates disk images [https://mkosi.systemd.io](https://mkosi.systemd.io).

For redpesk OS, the main goal is that it uses systemd-repart for making gpt
partitioning without any privilege using libfdisk [https://www.freedesktop.org/software/systemd/man/latest/systemd-repart.html](https://www.freedesktop.org/software/systemd/man/latest/systemd-repart.html).

Have a look on the man page for more information:

```
mkosi --help
```

or directly online on mkosi GitHub
[https://github.com/systemd/mkosi/blob/main/mkosi/resources/man/mkosi.1.md](https://github.com/systemd/mkosi/blob/main/mkosi/resources/man/mkosi.1.md)

## Simple example

### Raspberry Pi

In the `raspberry-pi` directory, you will find a **flat configuration** for generating a redpesk OS image for Raspberry supported platforms.

The idea is to make it easier to understand and to modify than in the root configuration of the repository.
There is only one configuration file, no profiles and one script executed for sha256 checksum and bmapfile generation.

To build a redpesk OS image for Raspberry targets, run:

```bash
cd raspberry-pi
mkosi
```

The generated image will be available in the `output` directory.

### SolidRun Hummingboard Pulse

In the `hummingboard-pulse` directory, you will find a **flat configuration** for generating a redpesk OS image for HummingBoard supported platforms.

The idea is to make it easier to understand and to modify than in the root configuration of the repository.
There is only one configuration file, no profiles. There is one script executed for sha256 checksum and bmapfile generation, whilst another is used to flash firmware at a specific offset within the image.

To build a redpesk OS image for SolidRun Hummingboard Pulse targets, run:

```bash
cd hummingboard-pulse
mkosi
```

The generated image will be available in the `output` directory.

## Boot the built image on the target

In the `output` directory, there is a `bmap` file usable for flashing a device (SD card, USB key...).

```bash
output/
|-- image -> image.raw
|-- image.SHA256SUMS
|-- image.raw
|-- image.raw.bmap
|-- image.raw.sha256
`-- image.raw.tar.xz
```

For the Raspberry Pi, you can follow the [instructions](https://docs.redpesk.bzh/docs/en/master/download/boards/docs/boards/raspi.html#copying-the-image-on-your-sdcard) to flash the image on the target.

For the SolidRun HummingBoard Pulse, you can follow the [instructions](https://docs.redpesk.bzh/docs/en/master/download/boards/docs/boards/solidrun-hummingboard-pulse.html#flash-the-sd-card) to flash the image on the target.

## Other examples

You can find more details on the usage of `mkosi` in redpesk by going to [rp-mkosi](https://github.com/redpesk-infra/rp-mkosi) repository.
