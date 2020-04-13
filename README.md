
# Pocong AI

[![Build Status](https://travis-ci.org/joemccann/dillinger.svg?branch=master)](https://travis-ci.org/joemccann/dillinger)

# Neural Network
  - Setiap pocong memiliki neural network. Neural networknya punya input layer berupa 5 neurons, 2 layer tersembunyi(hidden) dari 4 neurons dan satu output layer dari 2 neurons.
 
# Algoritma Genetika
  - Dibuat 200 populasi Pocong, masing-masing pocong dengan neural networknya masing-masing. Setelah semua Pocong mati, beberapa pocong dengan skor tertinggi dipilih untuk memproduksi dan menciptakan populasi baru sebanyak 200 pocong. Proses ini diulangi untuk setiap generasi.

### Instalasi

Pocong AI membutuhkan [Processing](https://processing.org/) v3
Install Processing kemudian jalankan
#### Linux Processing

```sh
$ wget -c https://download.processing.org/processing-3.5.4-linux64.tgz
$ tar -xzf processing-3.5.4-linux64.tgz
$ cd processing-3.5.4
$ chmod +x install.sh
$ ./install.sh
```
![](https://pasteboard.co/52702f55-857d-4118-8efc-c9fe80110246)
