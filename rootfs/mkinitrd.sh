#!/bin/sh
find | cpio -H newc -o | gzip -9 > ../core.gz