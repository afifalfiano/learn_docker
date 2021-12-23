Backup Volume
Sampe sekarang belum ada cara otomatis untuk backup volume, namun kita bisa memanfaatkan container untuk melakukan backup data yang ada divolume

Tahapam melakukan container
- matikan container yang menggunakan volume yang inin kita backup.
- buat container baru dengan dua mount, volume yang ining kita backup dan bind mount fodler dari sistem host.
- lakuakan backup menggunakan container baru tadi dengan cara archive isi volume dan simpan di bind mounts
- isi file backup sekarang akan ada di folder sistem host 
- delete container yang kita gunakan untuk melakukan backup

Eksekusi
docker container stop mongovolume
mkdir backup /Users/bsi/Documents/BSI/UpgradeSkill/Docker/belajar-docker-dasar/backup
docker container create --name nginxbackup --mount "type=bind,source=/Users/bsi/Documents/BSI/UpgradeSkill/Docker/belajar-docker-dasar/backup,destination=/backup" --mount "type=volume,source=mongodata,destination=/data" nginx:latest
docker container exec -it nginxbackup /bin/bash
tar cvf /backup/backup.tar.gz /data 
# Kita backup folder /data yang akan kita taruh didalam /backup dengan nama file backup.tar.gz
docker container stop nginxbackup
docker container rm nginxbackup 
docker container start mongovolume

Kita bisa melakukan secara sekali perintah saja dan menggunakan paramerter --rm untuk langsung hapus container yang kita gunakan untuk backup.
Pastikan ketika ingin membackup sebuah volume container kita perlu stop dulu untuk containernya supaya tidak ada update atau write ke mongodbnya 
docker container stop mongovolume
docker container run --rm --name ubuntu --mount "type=bind,source=/Users/bsi/Documents/BSI/UpgradeSkill/Docker/belajar-docker-dasar/backup,destination=/backup" --mount "type=volume,source=mongodata,destination=/data" ubuntu:latest tar cvf /backup/backup.tar.gz /data 

