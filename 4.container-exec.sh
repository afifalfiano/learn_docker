#Container Exec
#Cara untuk masuk ke container adalah dengan container exec.
docker container exec -it namacontainer atau idcontainer /bin/bash
#-i adalah argument interaktif artinya input tetap akitf
#-t adalah argument untuk terminal akses.
#/bin/bash kode program yang terdapat pada container
#Contoh
docker container exec -it contohredis /bin/bash

