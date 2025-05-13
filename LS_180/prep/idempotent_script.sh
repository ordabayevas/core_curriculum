DATABASE_NAME=$1
SQL_FILE_PATH=$2

dropdb $DATABASE_NAME

createdb $DATABASE_NAME

psql $DATABASE_NAME -f $SQL_FILE_PATH

# TO call:
# bash ./idempotent_script.sh ordabayeva /Users/ordabayeva/Documents/core_curriculum/LS_180/prep/test.sql