echo "Stopping and Removing Concourse container"
docker stop concourse
docker rm concourse
echo "Stopping and Removing PostgreSQL container"
docker stop concourse-db
docker rm concourse-db
# echo "Stopping and Removing DNS container"
# docker stop dns
# docker rm dns
echo "Removing Concourse bridge network"
docker network rm concourse-net
