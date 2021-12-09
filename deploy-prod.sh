
drush sset system.maintenance_mode 1

drush sql-dump > db/db-"$(date '+%Y-%m-%d %H:%M:%S')".sql

drush cr

git pull origin main

composer install --no-dev

drush cr

drush updb -y

drush csex prod -y

git add config/prod/*
git commit -m "MAJ des configs de la prod."
git push origin main

drush cim -y

drush cr

drush sset system.maintenance_mode 0
