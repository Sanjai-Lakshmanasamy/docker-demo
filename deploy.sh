set -e
docker stop $(docker ps -a -q) || true
docker rm $(docker ps -a -q) || true
echo "========================================================================="
echo "  CLEANED DOCKER"
echo "========================================================================="

ls
docker build -t demo:v1 .
echo "========================================================================="
echo "  DOCKER IMAGE BUILD COMPLETED"
echo "========================================================================="

sed -i -e 's#{version}#v1#g' docker-compose.yml 
docker-compose up -d
docker ps -a
echo "========================================================================="
echo "  DOCKER DEPLOY COMPLETED"
echo "========================================================================="

docker tag demo:v1 sanjai001/docker-demo:v1
docker push sanjai001/docker-demo:v1
echo "========================================================================="
echo "  DOCKER PUSHED TO DOCKER HUB"
echo "========================================================================="
