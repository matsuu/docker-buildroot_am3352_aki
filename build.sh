#!/bin/sh

docker="docker"
image="buildroot_am3352_aki"
name="buildroot_am3352_aki"

set -ex

"${docker}" build -t "${image}" .
"${docker}" run -d --name "${name}" "${image}"
"${docker}" cp "${name}":/buildroot_am3352_aki/output/images/sdcard.img .
"${docker}" stop "${name}"
"${docker}" rm "${name}"
