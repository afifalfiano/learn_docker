# Bind Mounts
# Bind mounts merupakan kemampuan melakukan mounting file atau folder uyang terdapat sistem host ke container yang terdapat di docker.

Parameter mount seperit berikut ini 
-type : mount, bind atau volume
-source: lokasi file atau folder di host
-destination: lokasi file atau folder di container
-readonly: jika ya maka dicontainer hanya bisa read only saja.

container craete --name namacontainer --mount "type:bind,source:folder,destination:folder,readonly" image:tag
# Contoh
docker container create --name mongodata --mount "type=bind,source=/Users/bsi/Downloads/mongo-data,destination=/data/db" --publish 27018:27017 --env MONGO_INITDB_ROOT_USERNAME=afif --env MONGO_INITDB_ROOT_PASSWORD=afif mongo:latest
# Patikan juga kita sudah memiliki folder yang ingin kita share dengan container
# Kemudian kita masuk ke mongo db, kemudian tambahkan database dan collection baru dengan insert document baru, setelah itu kita lihat ke bagian folder sharing kita di folder host Downloads
# Maka kita akan mendapatkan folder dan file yang ada dicontainer tadi

# Ketika ada kasus container mongodata hapus atau mati, maka kita bisa menjalankan perintah diatas dan otomatis data yang ada di mongo tetap ada karena data tadi sudah dibackup di host kita
