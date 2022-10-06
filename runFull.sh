#! /bin/bash


cd tools/ca-certificates/files
./nina-fw-create-roots.sh > ../../../run.log 2>&1
cp roots.pem ../../../data/roots.pem
cd ../../..

export IDF_PATH=$HOME/esp/esp-idf
export PATH=$PATH:~/esp/crosstool-NG/builds/xtensa-esp32-elf/bin

make all -B -j4 >> run.log 2>&1

./combine.py >> run.log 2>&1

./nullTermRootsPem.py >> run.log 2>&1

