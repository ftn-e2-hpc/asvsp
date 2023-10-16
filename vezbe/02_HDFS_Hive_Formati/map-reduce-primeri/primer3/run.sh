#!/bin/bash
docker exec -it resourcemanager bash -c "sed -i s/deb.debian.org/archive.debian.org/g /etc/apt/sources.list"
docker exec -it resourcemanager bash -c "sed -i 's|security.debian.org|archive.debian.org/debian-security/|g' /etc/apt/sources.list "
docker exec -it resourcemanager bash -c "sed -i '/stretch-updates/d' /etc/apt/sources.list"

docker exec -it nodemanager1 bash -c "sed -i s/deb.debian.org/archive.debian.org/g /etc/apt/sources.list"
docker exec -it nodemanager1 bash -c "sed -i 's|security.debian.org|archive.debian.org/debian-security/|g' /etc/apt/sources.list "
docker exec -it nodemanager1 bash -c "sed -i '/stretch-updates/d' /etc/apt/sources.list"

docker exec -it nodemanager2 bash -c "sed -i s/deb.debian.org/archive.debian.org/g /etc/apt/sources.list"
docker exec -it nodemanager2 bash -c "sed -i 's|security.debian.org|archive.debian.org/debian-security/|g' /etc/apt/sources.list "
docker exec -it nodemanager2 bash -c "sed -i '/stretch-updates/d' /etc/apt/sources.list"

docker exec -it resourcemanager bash -c "apt update"
docker exec -it nodemanager1 bash -c "apt update"
docker exec -it nodemanager2 bash -c "apt update"

docker exec -it resourcemanager bash -c "apt install python -y"
docker exec -it nodemanager1 bash -c "apt install python -y"
docker exec -it nodemanager2 bash -c "apt install python -y"

docker exec -it resourcemanager bash -c "hdfs dfs -rm -r -f /book*"
docker exec -it resourcemanager bash -c "rm -rf /example3"
docker cp . resourcemanager:/example3
docker exec -it resourcemanager bash -c "chmod +x /example3/map-reduce.sh && /example3/map-reduce.sh"