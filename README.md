# GCC toolchain generator script
Shell script to build plain elf gcc toolchains for various architectures

### Sample run:
`./doit -f -a "i386 x86_64 aarch64"`

This will download sources to and build 3 toolchains, for i386, x86_64 and aarch64. The resulting output will be located in

`<arch>-elf-<version>-<hostos>-<host arch>/`

For example: `aarch64-elf-7.1.0-Linux-x86_64/`

Run ./doit with -h for help.
