# Docker Volume
# Mirip dengan Bind Mounts bedanya terdapat management volume, seperit membuat volume, melihat list volume, dan hapus volume
# Volume sendiri bisa dianggap seperti storage untuk menyimpan data, bedanya dengan bind mounts adalah, data disimpan pada host langsung,
# tapi jika docker volume datanya disimpan oleh management docker atau didocker itu sendiri.

# By default data yang ada dicontainer akan disimpan di volume container. 
# Untuk melihat docker volume bisa jalankan perintah 
docker volume ls

#Membuat volume
docker volume create namavolume
# contoh 
docker volume create mongovolume
# Maka ketika kita jalankan perintah docker volume ls akan tampil mongovolume

# Hapus volume
docker volume rm namavolume
#untuk menghapus pastikan volume tersebut tidak digunakan atau dengan kata lain pastikan conttainer yang menggunakan volume tsb sudah stop
#contoh
docker volume rm mongovolume