#!/bin/sh

echo 'Populating CUSTOMERS2 table after altering the structure'

docker exec -i oracle sqlplus C\#\#MYUSER/mypassword@//localhost:1521/$1 << EOF
  insert into CUSTOMERS2 (first_name, last_name, email, gender, club_status, comments, country) values ('Josef', 'K', 'jk@confluent.io', 'Male', 'bronze', 'How is it even possible for someone to be guilty', 'Poland');
  update CUSTOMERS2 set club_status = 'silver' where email = 'gsamsa@confluent.io';
  exit;
EOF
