# Container Network
# Setelah membuat network docker, kita dapat menmambahkan container ke dalam network
# Container yang terdapat satu network akan dapat saling terkoneksi dengan catatan menggunakan driver bridge
# Container bisa mengakses container lain dengan menyebutkan hostname dari containernya yaitu nama container

# Membuat Container dengan Network
docker container create --name namacontainer --network namanetwork image:tag 

docker network create --driver bridge mongonetwork

docker container create --name mongodb --network mongonetwork --env MONGO_INITDB_ROOT_USERNAME=afif --env MONGO_INITDB_ROOT_PASSWORD=afif mongo:latest

# Kemudian saya ingin akses mongodb tersebut menggunakan mongo express dari website.
# Untuk publish port keluar kita tidak boleh menggunakan port yang sama, tapi jika didalam container itu sendiri masih bisa menggunakan port yang sama

docker image pull mongo-express:latest

docker container create --name mongodbexpress --publish 8081:8081 --network mongonetwork --env ME_CONFIG_MONGODB_URL="mongodb://afif:afif@mongodb:27017/" mongo-express:latest

# mongobd://afif:afif@mongodb:27017/
# mongodb, username:password@namahostcontainer:portcontainer tapi bukan yang dipublish

# kemudian tinggal buka saja dilocalhost dengan port 8081

# Menghapus container dari network
# Kita bisa memutus koneksi contaienr dari sebuah network name
docker netowkr disconnect namanetwork namacontainer
docker network disconnect mongonetwork mongodb

# Maka ketika kita coba akses lagi dari localhost:8081 
# maka interface mongodb express tidak tampil

# Menambahkan network terhadap container yang existing
# docker network connect namanetwork namacontaienr
docker network connect mongonetwork mongodb






