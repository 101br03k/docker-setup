mkdir stashapp && cd stashapp
curl -o docker-compose.yml https://raw.githubusercontent.com/stashapp/stash/master/docker/production/docker-compose.yml
docker-compose up -d
