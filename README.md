Quick Set up:

QUICK SET UP for everyone:

Make sure Docker is installed on your machine:
Docker: Docker.com - Accelerated Container Application Development// install docker desktop - follow instructions - Docker method is by far the most simple

Start the Cassandra container:

docker run -d --name cassandra -p 9042:9042 cassandra

Load the setup script (lets call it data.cql for this example):

Get-Content data.cql | docker exec -i cassandra cqlsh

**_Example start up script: _**

CREATE KEYSPACE IF NOT EXISTS store WITH REPLICATION =
{ 'class' : 'SimpleStrategy',
'replication_factor' : '1'
};

CREATE TABLE IF NOT EXISTS store.shopping_cart (
userid text PRIMARY KEY,
item_count int,
last_update_timestamp timestamp
);

INSERT INTO store.shopping_cart
(userid, item_count, last_update_timestamp)
VALUES ('9876', 2, toTimeStamp(now()));
INSERT INTO store.shopping_cart
(userid, item_count, last_update_timestamp)
VALUES ('1234', 5, toTimeStamp(now()));

**_Notice in the script that the keyspace is named store_**

Enter into the interactive shell to begin querying:
docker exec -it cassandra cqlsh

Now you’re in the interactive shell, and can begin querying:

Example with USE:

USE store;
SELECT \* FROM shopping_cart;

Example without USE:
SELECT \* FROM store.shopping_cart;

Both examples will print all users from the shopping_cart table
