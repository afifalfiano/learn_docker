# Container Resource Limit
# Supaya kita bisa melimit setiap resource container 
# Karena ketika tidak dilimit biasanya akan menggunakan resource yang terbagi pada container manager pada docker desktop

# Caranya cukup dengan menambahkan argument --memory kemudian diikuti 10b atau 10kb atau 10mb atau 10gb
# Selain memory kita juga bisa limit untuk cpu dengan arguments --cpus 1.5 yang artinya container bisa menggunakan cpu 1 dan setengah cpu core atau hardisknya

# Contoh
docker container create --name smallnginx --publish 8081:80 --memory 100m --cpus 0.5 nginx:latest
# Maka ketika kita lihat memory dan cpu dengan docker container ls -a akan terlihat pada container smallnginx dengan limit mem 100mb

