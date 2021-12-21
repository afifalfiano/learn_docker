# Container Environment
# Supaya env dapat berubah secara dinamis tanpa harus hard code untuk env tersebut.
# Jadi kita dapat mengirimkan env ke dalam container aplikasi






docker container create --name namacontainer --env KEY="value" env KEY2="value" image:tag
# Contoh
docker container create --name contohmongo --publish 27017:27017 --env MONGO_INITDB_ROOT_USERNAME=afif --env MONGO_INITDB_ROOT_PASSWORD=afif mongo:latest
# Jadi kita membuat conntainer dengan nama contohmongo dengna port forwarding 27017 dengan env MONGO_INITDB_ROOT_USERNAME = afif dan MONGO_INITDB_ROOT_PASSWORD= afif dengan image mongo versi terakhir
# Kemudian kita coba dengan mongo client, misalkan robomongo atau mongocompas, tinggal isikan username dan password maka akan berhasil login
