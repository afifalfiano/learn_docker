# Network
# By default docker network itu setiap containernnya teriosalsi satu sama lain dan tiak bisa terhubung.
# Tapi kita bisa membuat docker network denga nemmebrikan network pada setiap container supaya setiap container dapat saling terhubung.

# Sebelum membuat network docker kita harus menentukan netowkr driver,
# - bridge = driver yang digunakan untuk membuat network secara virtual yang memungkinkan container yang terkoneksi di bridge network yang sama saling berkomunikasi
# - host = driver yang digunakan untuk membuat network yang sama dengan sistem host. host hanya jalan di docker linux, tidak bisa diwindow atau mac
# - none = driver untuk membuat network tidak bisa saling berkomunikasi baik antar contaienr ataupun host.

# Melihat network
# untuk melihat network list tinggal jalankan
docker network ls

# Membuat network
docker network create --driver namadriver namanetwork
docker network create --driver bridge contohnetwork

# Menghapus network
docker network rm namanetwork
docker network rm contohnetwork
# Sebelum menghaus network pastikan tidak ada container yang menggunakan network tersebut

