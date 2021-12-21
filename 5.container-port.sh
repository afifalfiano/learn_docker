#Container Port
# Setiap container terioslasi didalam docker dan tidak bisa jika host(laptop) langsung mengakses aplikasi didalam container tersebut
# Port container hanya bisa diakses pada container, jadi dari host tidak bisa langsung tembak port tersebut

# Port Forwarding
# Untuk mengatasi hal tersebut kita bisa menggunakan port forwarding supaya host(laptop) dapat mengakses aplikasi tersebut
# berdasarkan portnya


docker contaienr create --name namacontainer --publish porthost:portcontainer image:tag
#Contoh
docker container create --name contohredis2 --publish 6379:6379 redis:latest
docker container create --name contohnginx --publish 8080:80 nginx:latest
#maka ketika kita start container dan cek docker container ls -a akan tampil seperti ini pada bagian status
# 0.0.0.0:8080->80/tcp
# maka kita bisa browsing localhost:8080 dan akan mengarah ke container nginx
