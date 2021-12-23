# Restore Volue

# Membuat volume baru untuk lokasi restore data backup
# Buat container dengan 2 mount, volume baru untuk r4store backup dan bind mouynt folder dari sistem host yang berisi file backup
# Melakukan restore menggunakan container dengan cara extract isis backup file ke dalam volume
# isi file restore sekarang sudah direstore di volume
# delete container yang kita gunakan untuk restore 
# volume baru sudah berisi data restore 

docker volume create mongorestore
docker container run --rm --name ubuntu --mount "type=bind,source=/Users/bsi/Documents/BSI/UpgradeSkill/Docker/belajar-docker-dasar/backup,destination=/backup" --mount "type=volume,source=mongorestore,destination=/data" ubuntu:latest bash -c  "cd /data && tar xvf /backup/backup.tar.gz --strip 1"
# Maka restore akan berjalan dan data restore ada di mongorestore
# Kemudian kita coba buat container dengan volume mount ke volume mongorestore
docker container create --name mongorestore --mount "type=volume,source=mongorestore,destination=/data/db" --publish 27020:27017 --env MONGO_INITDB_ROOT_USERNAME=afif --env MONGO_INITDB_ROOT_PASSWORD=afif mongo:latest
# Kemudian kita cek data menggunakan mongo compas maka data yang ada pada volume mongo akan ada di mongorestore