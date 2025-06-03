import streamlit as st
import pandas as pd
import mysql.connector

# Make connection
conn = mysql.connector.connect(host="localhost",
    user="root",
    password="CPSC408!",
    auth_plugin='mysql_native_password',
    database="Bookstore")

# Create cursor object
cur_obj = conn.cursor()

# User info from login
session_state = st.session_state

if 'clicked' not in st.session_state:
    st.session_state.clicked = False

# Functions
def click_button():
    st.session_state.clicked = not st.session_state.clicked

def location_search():
    # Get info from table
    cur_obj.execute('''
        SELECT *
        FROM Store;
    ''')
    result = cur_obj.fetchall()

    # Print complete address
    st.header("Locations")
    for i in range(len(result)):
        st.write(str(result[i][1]) + ", " + str(result[i][2]) + ", " + str(result[i][3]) + " " + str(result[i][4]))

def book_search():
    st.header("Search")
    result = None

    # Get ISBN as user input
    isbn = st.text_input("Enter the ISBN 13: ", "")

    # Once received
    if isbn:
        # Check to see if ISBN in Book table
        cur_obj.execute("SELECT * FROM Book WHERE ISBN_13 = " + str(isbn) + ";")
        result = cur_obj.fetchall()

        # If book found in table
        if result:
            # Print out book information
            st.subheader(str(result[0][1]))
            st.write("Author(s): " + str(result[0][2]))
            st.write("Price: " + str(result[0][6]))
            st.write("Rating: " + str(result[0][3]))
            st.write("Page Count: " + str(result[0][5]))
            st.write("")

            # Checks where book is in stock
            cur_obj.execute("SELECT * FROM Inventory INNER JOIN Store ON Inventory.StoreID = Store.StoreID WHERE ISBN_13 = " + str(isbn) + ";")
            result = cur_obj.fetchall()

            st.write("**In Stock:**") 
            
            # Print out quantity in all stores it is in stock
            if result:
                for i in range(len(result)):
                    if result[i][2] != 0:
                        st.write(str(result[i][4]) + ", " + str(result[i][5]) + ", " + str(result[i][6]) + " " + str(result[i][7]))
                        st.write("_Quantity:_ " + str(result[i][2]))
                        st.write("")
                        st.write("")
        else:
            st.write("Book with ISBN", isbn, "not found.")


    st.header("Statistics")

    # View shows all books available at all stores
    cur_obj.execute("SELECT * FROM vAvailableBooks")
    rows = cur_obj.fetchall()

    df = pd.DataFrame(rows, columns=["ISBN 13", "Title", "Author", "Price", "NumPages"])
    st.write(df)

    # cur_obj.execute('''
    # CREATE VIEW vAvailableBooks AS
    # SELECT DISTINCT Inventory.ISBN_13, Book.Title, Book.Author, Book.Price, Book.NumPages 
    # FROM Inventory
    # INNER JOIN Book
    #     ON Inventory.ISBN_13 = Book.ISBN_13 ; 
    # ''')
    # conn.commit()

    # Stats: Showing how many books carried per store
    cur_obj.execute('''
        SELECT Store.State, COUNT(Inventory.StoreID), COUNT(Book.Author)
        FROM Inventory
        INNER JOIN Store
            ON Inventory.StoreID = Store.StoreID
        INNER JOIN Book
            ON Inventory.ISBN_13 = Book.ISBN_13
        GROUP BY Inventory.StoreID                
    ''')
    rows2 = cur_obj.fetchall()

    df2 = pd.DataFrame(rows2, columns=["Location City", "Different Books Available", "Different Authors Available"])
    st.write(df2)


# Customer Menu Pages
def customer_menu():
    st.title("Customer Menu")

    def account_info(): 
        # Get information
        cur_obj.execute("SELECT * FROM Customer WHERE CustomerID = " + str(session_state.user_ID) + ";")
        result = cur_obj.fetchall()

        cur_obj.execute("SELECT COUNT(*) FROM Purchase WHERE CustomerID = " + str(session_state.user_ID) + ";")
        purchaseCount = cur_obj.fetchall()

        cur_obj.execute("SELECT SUM(RewardPoints) FROM Purchase WHERE CustomerID = " + str(session_state.user_ID) + ";")
        points = cur_obj.fetchall()

        # Print information
        st.subheader("Name: " + result[0][1] + " " + result[0][2])
        st.subheader("Email: " + result[0][4])
        if result[0][3] != None:
            st.subheader("Birthday: " + str(result[0][3]))
        st.subheader("Total Purchases: " + str(purchaseCount[0][0]))
        if points[0][0] == 0:
            st.subheader("Not part of rewards program")
        else:
            st.subheader("Reward Points: " + str(points[0][0]))
     

    def purchase_history():
        # Get purchases from table
        cur_obj.execute("SELECT * FROM Purchase WHERE CustomerID = " + str(session_state.user_ID) + ";")   
        result = cur_obj.fetchall()

        # Print out information from table 
        for i in range(len(result)):
            cur_obj.execute("SELECT * FROM Book WHERE ISBN_13 = " + str(result[i][1]) + ";")
            bookStuff = cur_obj.fetchall()

            st.subheader(str(bookStuff[0][1])) 
            st.write("Author(s): " + str(bookStuff[0][2])) 
            st.write("ISBN 13: " + str(result[i][1]))
            st.write("Price: " + str(bookStuff[0][6])) 
            st.write("Date: " + str(result[i][2]))

            # Checks if customer is enrolled to reward system
            if result[i][3] == 0:
                st.write("No reward points from this transaction")
            else:
                st.write("Points: " + str(result[i][3]))
            st.write("")
            st.write("")
            
    # Dictionary maps page names to functions
    pages = {
        "Store Locations": location_search,
        "Find Book": book_search,
        "Purchase History": purchase_history,
        "Account Info": account_info,
    }

    # Displays buttons to select pages
    selection = st.radio("Go to", list(pages.keys()))

    st.markdown("<hr>", unsafe_allow_html=True)

    # Execute selected page function
    pages[selection]()




# Employee Menu / Pages
def employee_menu():
    st.title("Employee Menu")
    cur_obj.execute("SELECT StoreID FROM Employee WHERE EmployeeID = " + str(session_state.user_ID) + ";")
    storeID = cur_obj.fetchall()

    def store_inventory():
        # Collecting info from tables
        # Using joins across Book, Inventory, and Store tables
        # Also using subqueries
        cur_obj.execute("SELECT ISBN_13,Title, Author, Price, NumPages FROM Book WHERE ISBN_13 IN (SELECT ISBN_13 FROM Inventory WHERE StoreID IN (SELECT StoreID FROM Employee WHERE EmployeeID = " + str(session_state.user_ID) + "));")
        result = cur_obj.fetchall()
        
        cur_obj.execute("SELECT * FROM Store WHERE StoreID = " + str(storeID[0][0]) + ";")
        address = cur_obj.fetchall()
        st.header(str(address[0][1]) + ", " + str(address[0][2]) + ", " + str(address[0][3]) + " " + str(address[0][4]))
      

        
        # User can add books to inventory
        def add_book():
            cur_obj.execute("SET autocommit = 0;")
            cur_obj.execute("START TRANSACTION")
            isbn = st.text_input("ISBN 13: ", "")
            quantity = st.text_input("Quantity: ", "")
            done = st.button("Submit")

            # Check book is in Book table
            if isbn:
                cur_obj.execute("SELECT * FROM Book WHERE ISBN_13 = " + str(isbn) + ";")
                result = cur_obj.fetchall()
                
                # Book found in table 
                if result:
                    # All user input collected
                    if done:
                        query = "INSERT INTO Inventory(StoreID, ISBN_13, Quantity) VALUES (%s, %s, %s)"
                        values = (storeID[0][0], isbn, quantity)
                        cur_obj.execute(query, tuple(values))
                        cur_obj.execute("COMMIT;")
                else:
                    st.write("ISBN number not found in database.")
                    cur_obj.execute("ROLLBACK;")
            cur_obj.execute("SET autocommit = 1;")
            


        # User can alter quantity of books carried
        def modify_book():
            cur_obj.execute("SET autocommit = 0;")
            cur_obj.execute("START TRANSACTION")
            isbn = st.text_input("ISBN 13: ", "")
            quantity = st.text_input("Quantity: ", "")
            done = st.button("Submit")

            if isbn:
                cur_obj.execute("SELECT * FROM Inventory WHERE StoreID = " + str(storeID[0][0]) + " AND ISBN_13 = " + isbn + ";")
                result = cur_obj.fetchall()
                
                # Book found in inventory 
                if result:
                    # All user input collected
                    if done:
                        cur_obj.execute("UPDATE Inventory SET Quantity = " + quantity + " WHERE ISBN_13 = " + isbn + ";")
                        cur_obj.execute("COMMIT;")
                else:
                    st.write("ISBN number not found in inventory.")
                    cur_obj.execute("ROLLBACK;")

            cur_obj.execute("SET autocommit = 1;")
            

            
        # User can delete book from inventory
        def delete_book():
            cur_obj.execute("SET autocommit = 0;")
            cur_obj.execute("START TRANSACTION")
            isbn = st.text_input("ISBN 13: ", "")
            done = st.button("Submit")

            if isbn:
                cur_obj.execute("SELECT * FROM Inventory WHERE StoreID = " + str(storeID[0][0]) + " AND ISBN_13 = " + isbn + ";")
                result = cur_obj.fetchall()
                
                if result:
                    if done:
                        cur_obj.execute("DELETE FROM Inventory WHERE StoreID = " + str(storeID[0][0]) + " AND ISBN_13 = " + isbn + ";")
                        cur_obj.execute("COMMIT;")
                else:
                    cur_obj.execute("ROLLBACK;")

            cur_obj.execute("SET autocommit = 1;")



        # Empty page
        def blank_page():
            st.write()
            
        # Option to add or delete books from inventory
        options  = {
            "": blank_page,
            "Add To Inventory": add_book,
            "Modify Inventory": modify_book,
            "Delete From Inventory": delete_book
        }

        choice = st.radio("", list(options.keys()))

        options[choice]()


        
        # For all items in inventory (if there are any)
        if result:
            export_button = st.button("Export Inventory as CSV")

            # Exports as CSV Files
            if export_button:
                cur_obj.execute("SHOW COLUMNS FROM Inventory;")
                columns = cur_obj.fetchall()
                column_names = [column[0] for column in columns]

                csv_file = "Inventory.csv"

                with open(csv_file, 'w', newline='') as f:
                    f.write(",".join(map(str, column_names)) + "\n")
                    for row in result:
                        f.write(",".join(map(str, row)) + "\n")

                st.write("CSV file exported successfully.")

            # Print inventory on website
            for i in range(len(result)):
                cur_obj.execute("SELECT DISTINCT * FROM Inventory WHERE ISBN_13 = " + str(result[i][0]) + ";")
                quantity = cur_obj.fetchall()

                if (quantity[0][2] > 0):
                    st.subheader(str(result[i][1])) 
                    st.write("Author(s): " + str(result[i][2])) 
                    st.write("ISBN 13: " + str(result[i][0]))
                    st.write("Price: " + str(result[i][3])) 
                    st.write("Quantity: " + str(quantity[0][2]))
                    st.write("")
                    st.write("")
        
    def account_info():
        # Get Employee personal info
        cur_obj.execute("SELECT * FROM Employee WHERE EmployeeID = " + str(session_state.user_ID) + ";")
        result = cur_obj.fetchall()

        # Get employee's store adress
        cur_obj.execute("SELECT * FROM Store WHERE StoreID = " + str(result[0][1]) + ";")
        store = cur_obj.fetchall()

        # Print
        st.write("Name: " + str(result[0][2]) + " " + str(result[0][3]))
        st.write("Position: " + str(result[0][4]))
        st.write("Work Address: " + str(store[0][1]) + ", " + str(store[0][2]) + ", " + str(store[0][3] + " " + str(store[0][4])))
 
    def customer_search():
        # # View all customers
        # cur_obj.execute("SELECT * FROM Customer;")
        # all_customers = cur_obj.fetchall()

        #Find specific customer
        result = None

        # Get customer's last name
        name_search = st.text_input("Enter last name: ", "")
        if name_search:
            cur_obj.execute("SELECT * FROM Customer WHERE LastName = '" + str(name_search) + "';")
            result = cur_obj.fetchall()

            # If person found, print their info
            if result:
                for i in range(len(result)):
                    st.subheader(str(result[i][1]) + " " + str(result[i][2]))
                    st.write("ID Number: " + str(result[i][0]))
                    st.write("Birthday: " + str(result[i][3]))
                    st.write("")

            else:
                st.write("Customer with last name \"" + name_search + "\" not found.")

    def customer_add():
        # Get new customer's information 
        first_name = st.text_input("First Name: ", "")
        last_name = st.text_input("Last Name: ", "")
        email = st.text_input("Email: ", "")
        birthday = st.text_input("Birthday (year-month-day): ", "")

        # Insert into Customer table
        if first_name and last_name and email and birthday:
            query = "INSERT INTO Customer(FirstName, LastName, Email, Birthday) VALUES (%s, %s, %s, %s)"
            values = (first_name, last_name, email, birthday)
            cur_obj.execute(query, values)
            conn.commit()
            st.write("New customer enrolled successfully.")


    # Dictionary maps page names to functions
    pages = {
        "Store Locations": location_search,
        "Store Inventory": store_inventory,
        "Find Book": book_search,
        "Employee Info": account_info,
        "Customer Search": customer_search,
        "Enroll Customer": customer_add
    }

    # Displays buttons to select pages
    selection = st.radio("Go to", list(pages.keys()))

    st.markdown("<hr>", unsafe_allow_html=True)

    # Execute selected page function
    pages[selection]()


# Frontend
if session_state.user_customer:
    customer_menu()

if session_state.user_employee:
    employee_menu()
  



# Close connections
cur_obj.close()
conn.close()