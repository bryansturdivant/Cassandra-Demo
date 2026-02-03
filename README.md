# Quick Set up:

## Prerequisites:

Install the latest version of Java on your device (Java 17) through Oracle
- https://www.oracle.com/java/technologies/downloads/#java17
Check if Java is properly installed on your machine
```powershell
java --version
```

Make sure Docker is installed on your machine:
- **Docker Desktop**: [docker.com](https://www.docker.com/) - Follow installation instructions
- *Note: The Docker method is by far the simplest approach*
```powershell
docker --version
```

## Set up
### 1. Start the Cassandra container:
```bash
docker run -d --name cassandra -p 9042:9042 cassandra
```
### 2. Load the setup script:

Assuming set up script is `data.cql` (it is):

**PowerShell**
```powershell
Get-Content data.cql | docker exec -i cassandra cqlsh
```

**Bash/Linux/Mac**
```bash
cat data.cql | docker exec -i cassandra cqlsh
```

###Example Startup Script

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

**Note**: The keyspace in this script is named `store`

### 3. Enter the Interactive Shell

```bash
docker exec -it cassandra cqlsh
```

### Querying Examples
Once in the interactive shell, you can query the database:

### Example with USE:
```sql
USE store;
SELECT * FROM shopping_cart;
```
### Example without USE:
```sql
SELECT \* FROM store.shopping_cart;
```
Both examples will print all users from the shopping_cart table

**Note**: If you need to upload another script, you must exit the interactive shell. 

**DROPPING TABLES**: If you want to start over fresh with our original table, you must drop it, and then create it again. Without needing to mess with our script, you can drop the table in the interactive shell with this: 

```sql
DROP TABLE keyspace_name.table_name;
```

OR drop the entire keyspace:

```sql
DROP KEYSPACE keyspace_name;
```

## CRUD Examples for Video/Reference:

### 1. Create/Insert: 

Create: 

```sql
CREATE KEYSPACE IF NOT EXISTS cityDB WITH REPLICATION = {'class': 'SimpleStrategy', 'replication_factor' : 1};
```

```sql
CREATE TABLE IF NOT EXISTS cityDB.cities (
    id INT PRIMARY KEY,
    name text,
    countrycode text,
    district text, 
    population int
);
```

Insert:

```sql
INSERT INTO cityDB.cities
(id, name, countrycode, district, population)
VALUES(6, 'Rotterdam', 'NLD', 'Zuid-Holland', 593321)
```


### 2. Read:

read all: 

```sql
SELECT * FROM cityDB.cities;
```

read some data:

```sql
SELECT name FROM cityDB.cities WHERE countrycode = 'AFG';
```

### 3. Update:

```sql
UPDATE cityDB.cities
SET population = 1500
WHERE id = 1;
```

### 4. Delete:

```sql
DELETE FROM cityDB.cities
WHERE id = 1;
```
You can only delete using a partition key in Cassandra. For example, using:

```sql
DELETE FROM cityDB.cities
WHERE countrycode = 'AFG';
```
WILL NOT WORK
