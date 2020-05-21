mpod=$(oc get pods --selector app=mysql --output name | awk -F/ '{print $NF}')

mpod=mysql-1-hsxpk
echo "Copying setup files into pod..."
oc cp database/create-book-table.sql $mpod:/tmp/create-book-table.sql
oc cp database/insert-book-data.sql ${mpod}:/tmp/insert-book-data.sql

echo "Creating table(s)..."
oc exec $mpod -- bash -c "mysql --user=root bookstore < /tmp/create-book-table.sql"

echo "Importing data..."
oc exec $mpod -- bash -c "mysql --user=root < /tmp/insert-book-data.sql"

echo "Here is your table:"
oc exec $mpod -- bash -c "mysql --user=root bookstore -e 'use bookstore; SELECT * FROM book;'"


echo "Granting privileg to user1..."
oc exec $mpod -- bash -c "mysql --user=root -e 'GRANT ALL PRIVILEGES ON *.* TO '\''user1'\''@'\''%'\'' ;'"

echo "All done with database setup !!!!"
