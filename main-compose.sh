function main-compose() {
  docker compose -f ~/projects/main-compose/docker-compose.yml "$@"
}

function switch-mysql() {
  echo 'Switching mysql instances'
  if main-compose ps | grep -q 'mysql-5-7'
  then
    main-compose down mysql-5-7
    main-compose up -d mysql-8
  else
    main-compose down mysql-8
    main-compose up -d mysql-5-7
  fi
}
