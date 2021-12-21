Container Volume
Kita bisa menggunakan volume buatan sendiri supaya ketika container terhapus data tetap ada divolume
Cara seperti ketika bind mounts hanya bedanya pada argument berikut ini
--mount "type:volume,source:namavolume" untuk source dan dst sama seperti bind mounts

Contohnya
docker container create --name mongovolume --mount "type=volume,source=mongodata,destination=/data/db" --publish 27019:27017 --env MONGO_INITDB_ROOT_USERNAME=afif --env MONGO_INITDB_ROOT_PASSWORD=afif mongo:latest
Kemudian kita akses lagi mongovolume dengan menambahkan beberapa data. Kemudian kita coba hapus container mongovolume dan cek pada mongodata volume apakah data masih ada atau tidak.

ketika kita hapus container mongovolume maka akan gagal melakukan koneksi ke mongodb melalui compas mongodb
Setelah itu kita jalankan lagi perintah create container mongovolume dengan menggunakan volume mongodata tadi.
Kita cek apakah ketika setelah dihapus data tadi masih ada atau tidak divolume tersebut.

Yap, setelah kita cek ternyata data masih ada, dan inilah salah satu keunggulan volume