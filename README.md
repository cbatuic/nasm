# nasm
NASM

* Google Cloud Platform (GCP) Debian/Linux Cloud Terminal
* [source 1](https://www.youtube.com/watch?v=_JG4b7E_6-E)
* [source 2](https://www.youtube.com/watch?v=hBhaaOwuocU&list=RDCMUCYXWGO7hi4McH2qRLWq1dIQ&index=2)

```bash
$ lsb_release -a
$ whereis nasm
# nasm: usr/local/bin/nasm   or
# nasm:
# if no path then install
$ wget https://www.nasm.us/pub/nasm/releasebuilds/2.15.05/nasm-2.15.05.tar.gz
$ tar -xf nasm-2.15.05.tar.gz
$ cd nasm-2.15.05/
$ ./configure
$ make
$ sudo make install
```
