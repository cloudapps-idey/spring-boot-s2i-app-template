mpod=$(oc get pods --selector app=mysql --output name | awk -F/ '{print $NF}')

echo "Copying setup files into pod..."
oc cp ./create-book-table.sql $mpod:/tmp/create-book-table.sql.sql
oc cp ./insert-book-data.sql ${mpod}:/tmp/insert-book-data.sql

echo "Creating table(s)..."
oc exec $mpod -- bash -c "mysql --user=root sampledb < /tmp/create-book-table.sql"

echo "Importing data..."
oc exec $mpod -- bash -c "mysql --user=root < /tmp/insert-book-data.sql"

echo "Here is your table:"
oc exec $mpod -- bash -c "mysql --user=root bookstore -e 'use bookstore; SELECT * FROM book;'"

# Temporary fix because MySQL 8.* client isn't secure in mysqljs Nodejs module
echo "Setting user password..."
oc exec $mpod -- bash -c "mysql --user=root -e 'ALTER USER '\''userBMN'\'' IDENTIFIED WITH mysql_native_password BY '\''vRUWhkydWOKdMDLd'\'';'"

echo "Flushing privileges..."
oc exec $mpod -- bash -c "mysql --user=root -e 'GRANT ALL PRIVILEGES ON *.* TO '\''user1'\'@'\''%'\'';"

