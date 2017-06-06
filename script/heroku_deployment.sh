#!/bin/bash
#
# by Harish Ramachandran

echo "Pushing changes to Heroku"
git push heroku master

echo "Migrating Heroku's Postgres db"
heroku run rake db:migrate

echo "Restarting Heroku"
heroku restart
