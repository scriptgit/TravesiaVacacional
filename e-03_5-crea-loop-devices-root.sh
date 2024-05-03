#!/bin/bash

#@Autor: Jorge Octaviop Barcenas Avelar
#        Angel Eduardo Oropeza Castañeda
#        Ulises Eduardo Antonio García
#@Descripción: Utilizando el método por loop devices se crearan puntos de montaje
#que servirán para simular discos y que se utilizaran en clases futuras para 
#comprender varios conceptos del curso.

echo "Creando archivos binarios para asociarlos a loop devices"

echo "creando carpetas (puntos de montaje)"
diskLoop="/travesia/loop-devices"

mkdir -p ${diskLoop}

echo "Creando archivos binarios"
cd ${diskLoop}

dd if=/dev/zero of=disk-01.img bs=100M count=20
dd if=/dev/zero of=disk-02.img bs=100M count=20
dd if=/dev/zero of=disk-03.img bs=100M count=20
dd if=/dev/zero of=disk-04.img bs=100M count=20
dd if=/dev/zero of=disk-05.img bs=100M count=20
dd if=/dev/zero of=disk-06.img bs=100M count=20
dd if=/dev/zero of=disk-07.img bs=100M count=20
dd if=/dev/zero of=disk-08.img bs=100M count=20

echo "comprobando la creación"
du -sh disk*.img

echo "asociando archivos binarios a loop devices"
losetup -fP disk-01.img
losetup -fP disk-02.img
losetup -fP disk-03.img
losetup -fP disk-04.img
losetup -fP disk-05.img
losetup -fP disk-06.img
losetup -fP disk-07.img
losetup -fP disk-08.img

echo "confirmar creación"
losetup -a

echo "formateando nuevos dispositivos"

mkfs.ext4 disk-01.img
mkfs.ext4 disk-02.img
mkfs.ext4 disk-03.img
mkfs.ext4 disk-04.img
mkfs.ext4 disk-05.img
mkfs.ext4 disk-06.img
mkfs.ext4 disk-07.img
mkfs.ext4 disk-08.img

echo "Creando puntos de montaje"

mkdir -p /travesia/disk-01
mkdir -p /travesia/disk-02
mkdir -p /travesia/disk-03
mkdir -p /travesia/disk-04
mkdir -p /travesia/disk-05
mkdir -p /travesia/disk-06
mkdir -p /travesia/disk-07
mkdir -p /travesia/disk-08
