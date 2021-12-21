## Docker Container (Seperti Aplikasi Hasil Installer)
## Ketika sebuah image digunakan untuk container, maka images tidak bisa digunakan karena sedang digunakan
## Hal ini disebabkan karena container hanya menggunakan isi dari image, bukan copy isi dari image.

# Untuk melihat container list 
docker container ls -a

# Membuat container
docker container create --name namacontainer namaimage:tag
#Example
docker container create --name contohredis redis:latest
#Kita bisa membuat contaienr lebih dari satu dengan image yang sama asalkan nama container berbeda.

#Menjalankan container
docker container start namacontainer atau idcontainer
#Example
docker container start contohredis

#Menghentikan Container
docker container stop namacontainer atau idcontainer
#Example
docker container stop contohredis
# Up artinya aktif, exited artinya stop (dalam status container)

#Menghapus container
docker container rm namacontainer atau idcontainer
