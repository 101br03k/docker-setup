docker run -d --name ttrssdb nornagon/postgres
docker run -d --link ttrssdb:db -p 80:80 clue/ttrss
echo"default user and password = admin / password"
