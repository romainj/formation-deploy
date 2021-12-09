
drush sset system.maintenance_mode 1

drush sql-dump > db/db-"$(date '+%Y-%m-%d %H:%M:%S')".sql

drush cr

git pull origin main

composer install --no-dev

drush cr

drush updb -y

drush cim -y

drush cr

drush sset system.maintenance_mode 0
