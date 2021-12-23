Docker Compose
Sebuah tool yang digunakan untuk menefisiniak dan menjalankan multi container docker aplikasi. 
Jadi kita bisa membuat beberapa container dan langsung menjalankan tanpa harus membuat satu persatu.


Format yang digunakan untuk membuat docker compose adalah yml.

Pada kesempatan ini kita membuat menggunakan docker compose versi 3.7
Kemudian seperti ini isi dari docker-compose.yml.

=================
version: "3.7"

services:
    mongo:
        container_name: mongo
        image: mongo:4-xenial
        ports:
            - 27017:27017
        networks:
            - java-network
    redis:
        container_name: redis
        image: redis:5
        ports: 
            - 6379:6379
        networks:
            - java-network
    java-docker:
        container_name: java-docker
        image: thingswise/java-docker
        ports:
            - 8080:8080
        depends_on:
            - redis 
            - mongo
        environment:
            - NAME=docker
            - MONGO_HOST=mongo
            - MONGO_PORT=27017
            - REDIS_HOST=redis
            - REDIS_PORT=6379
        networks:
            - java-network

networks:
    java-network:
        name: java-network

==================

Jika ingin mencoba copy saja dari baris 12 - 47 dengan nama docker-compose.yml
Kemudian jalankan perintah docker-compose up (akan mencreate dan menjalankan container)
docker-compose down (hapus dan stop container (termasuk jika ada data didalam container akan terhapus))

Kemudian setelah selesai tinggl cek dibrowser http://localhost:8080/actuator/health