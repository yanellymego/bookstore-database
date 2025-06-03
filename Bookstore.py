# import MySQL
import mysql.connector

# make Connection
conn = mysql.connector.connect(host="localhost",
    user="root",
    password="CPSC408!",
    auth_plugin='mysql_native_password',
    database="Bookstore")

#create cursor object
cur_obj = conn.cursor()

#Print out connection to verify
print(conn)

#Create Tables
# cur_obj.execute('''
#     CREATE TABLE Store(
#         StoreID INTEGER NOT NULL PRIMARY KEY,
#         Address VARCHAR(50) NOT NULL
#         City VARCHAR(50) NOT NULL,
#         State VARCHAR(50) NOT NULL,
#         Zipcode INTEGER NOT NULL,
#     );
# ''')
# 
# cur_obj.execute('''
#     CREATE TABLE Customer(
#         CustomerID INTEGER PRIMARY KEY AUTO_INCREMENT,
#         FirstName VARCHAR(50) NOT NULL,
#         LastName VARCHAR(50) NOT NULL,
#         Birthday DATE
#         Email VARCHAR(255)
#     );
# ''')
# 
# cur_obj.execute('''
#     CREATE TABLE Employee(
#         EmployeeID INTEGER NOT NULL PRIMARY KEY,
#         StoreID INTEGER NOT NULL,
#         FOREIGN KEY (StoreID) REFERENCES Store(StoreID), 
#         FirstName VARCHAR(50) NOT NULL,
#         LastName VARCHAR(50) NOT NULL,
#         Position VARCHAR(50) NOT NULL
#     );
# ''')

# cur_obj.execute('''
#     CREATE TABLE Book(
#         ISBN_13 BIGINT NOT NULL PRIMARY KEY,
#         Title VARCHAR(250) NOT NULL,
#         Author TEXT NOT NULL,
#         AverageRating DECIMAL(10,2),
#         LanguageCode VARCHAR(50),
#         NumPages INTEGER,
#         Price DECIMAL(10,2)
#     );
# ''')

# cur_obj.execute('''
#     CREATE TABLE Inventory(
#         StoreID INTEGER NOT NULL,
#         FOREIGN KEY (StoreID) REFERENCES Store(StoreID),
#         ISBN_13 BIGINT NOT NULL,
#         FOREIGN KEY (ISBN_13) REFERENCES Book(ISBN_13),
#         Quantity INTEGER NOT NULL
#     );
# ''')

# cur_obj.execute('''
#     CREATE TABLE Purchase(
#         CustomerID INTEGER NOT NULL,
#         FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
#         ISBN_13 BIGINT NOT NULL,
#         FOREIGN KEY (ISBN_13) REFERENCES Book(ISBN_13),
#         Date DATE NOT NULL,
#         RewardPoints INTEGER
#     );
# ''')


#Inserting data
# insertQuery ='''
# INSERT INTO Store
# VALUES(%s,%s,%s,%s,%s);
# '''

# values = [
#     (1, '1 University Dr', 'Orange', 'California', 92866),
#     (2, '65688 Jevon Lake', 'North Dayna', 'Arkansas', 79222),
#     (3, '4350 Collier Bypass', 'Ritchietown', 'South Carolina', 80409),
#     (4, '671 Devan Street Suite 192', 'Easterview', 'Utah', 67823),
#     (5, '352 Baby Wells', 'Bednarmouth', 'Arizona', 39002),
# ]

# cur_obj.executemany(insertQuery, values)
# conn.commit()

# insertQuery ='''
# INSERT INTO Customer
# VALUES(%s,%s,%s,%s);
# '''

# values = [
#     (1, 'Moses', 'Waelchi', '1996-08-07', 'mo.waelchi@gmail.com'),
#     (2, 'Jade', 'Rippin', '1989-08-17', 'RippinTheLippo@yahoo.com'),
#     (3, 'Macie', 'Emard',  '1983-11-23', 'macieemard@gmail.com'),
#     (4, 'Benjamin', 'Goyette', '1999-05-09', 'twilight1245@hotmail.com'),
#     (5, 'Kelly', 'Swift','2002-12-25', 'fangirl300@outlook.com'),
# ]

# cur_obj.executemany(insertQuery, values)
# conn.commit()

# insertQuery ='''
# INSERT INTO Employee
# VALUES(%s,%s,%s,%s,%s);
# '''

# values = [
#     (1, 2, 'Savannah', 'Terry', 'Bookseller'),
#     (2, 2, 'Eduardo', 'Price', 'Manager'),
#     (3, 4, 'Thalia', 'Lowe',  'Bookseller'),
# ]

# cur_obj.executemany(insertQuery, values)
# conn.commit()

# data = helper.data_cleaner("books.csv")
# insertQuery ='''
# INSERT INTO Book
# VALUES(%s,%s,%s,%s,%s,%s,%s);
# '''
# cur_obj.executemany(insertQuery, data)
# conn.commit()

# insertQuery ='''
# INSERT INTO Inventory
# VALUES(%s,%s,%s);
# '''

# values = [
#     (1, 9781593081775, 3),
#     (2, 9780439554893, 0),
#     (3, 9781593081775, 1),
#     (4, 9781593081775, 15),
#     (5, 9780441102679, 2),

#     (1, 9780439554893, 0),
#     (2, 9781593081775, 0),
#     (3, 9780325001531, 3),
#     (4, 9780439554893, 1),
#     (5, 9780439554893, 10),

#     (1, 9780441102679, 2),
#     (2, 9780441102679, 0),
#     (3, 9780441102679, 0),
#     (4, 9780441102679, 4),
#     (5, 9781593081775, 2),
#  ]

# cur_obj.executemany(insertQuery, values)
# conn.commit()


# insertQuery ='''
# INSERT INTO Purchase
# VALUES(%s,%s,%s,%s);
# '''

# values = [
#     (2, 9780439554893, '2024-05-11', 0),
#     (5, 9780441102679, '2023-12-15', 1500),
#     (5, 9781593081775, '2024-01-31', 1500),
# ]

# cur_obj.executemany(insertQuery, values)
# conn.commit()


cur_obj.execute("SELECT * FROM Customer")
result = cur_obj.fetchall()

for row in result:
    print(row)


cur_obj.close()
conn.close()