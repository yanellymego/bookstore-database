import streamlit as st
import mysql.connector

# Make connection
conn = mysql.connector.connect(host="localhost",
    user="root",
    password="CPSC408!",
    auth_plugin='mysql_native_password',
    database="Bookstore")

# Create cursor object
cur_obj = conn.cursor()

# Frontend
session_state = st.session_state

session_state.user_ID = st.text_input("User ID") 
session_state.user_email = st.text_input("Email")


customerLogin = st.button("I am a customer")
employeeLogin = st.button("I am an employee")

session_state.user_customer = False
session_state.user_employee = False

if customerLogin:
    # Gets and checks log in credentials
    cur_obj.execute("SELECT * FROM Customer WHERE CustomerID = " + str(session_state.user_ID) + ";")
    db_cust_ID = cur_obj.fetchall()

    if not db_cust_ID:
        st.write("Please enter a valid customer ID.")
    

    cur_obj.execute("SELECT * FROM Customer WHERE Email = '" + str(session_state.user_email) + "';")
    db_cust_Email = cur_obj.fetchall()


    if not db_cust_Email: 
        st.write("Email not associated with User ID")

    if db_cust_Email and db_cust_ID:
        cur_obj.execute("SELECT * FROM Customer WHERE CustomerID = " + str(session_state.user_ID) + " AND Email = '" + str(session_state.user_email) + "';")
        result = cur_obj.fetchall()

        if result:
            session_state.user_customer = True
            session_state.user_employee = False
            st.title("<-- Select page from the left hand menu")
        else:
            st.write("ID and password do not match.")


if employeeLogin:
    # Gets and checks log in credentials
    cur_obj.execute("SELECT * FROM Employee WHERE EmployeeID = " + str(session_state.user_ID) + ";")
    db_emp_ID = cur_obj.fetchall()

    if not db_emp_ID:
        st.write("Please enter a valid employee ID.")
    
    if db_emp_ID: 
        session_state.user_customer = False
        session_state.user_employee = True
        st.title("<-- Select page from the left hand menu")


    
# Close connections
cur_obj.close()
conn.close()