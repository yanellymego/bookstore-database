# Bookstore-database
A Streamlit-based web interface for interacting with a MySQL bookstore database. This project was built as part of a Database Management course and demonstrates the integration of a frontend interface with a relational database backend.

## Features
  - Login system for both customers and employees
  - Separate menu views based on user type
  - View, add, modify, and delete books in current store inventory (employee only)
  - Enroll customers into the membership program (employee only)
  - Export all branch inventory as a CSV file (employee only)
  - View purchase history and account information (customer only)
  - Database interactions handled using MySQL Connector for Python
    
## Requirements
- Streamlit library  
  (In terminal: pip install streamlit)

## How to run
streamlit run Login.py

## Testing tips
- When there is the opportunity to enter text user input (through the text input widget), make sure to press the return/enter button on your keyboard. Otherwise, it will not register the user input
- After deleting a book from the inventory, sometimes a little red square warning pops up that talks an array out of index. If you press into any other page and then come back or even pressing the empty option above "Add a book", it goes away. 
- Demo credentials:
  - Employee: ID 3, Email thalia.lowe@gmail.com
  - Customer: ID 5, Email fangirl300@outlook.com
  - Book ISBN (to add, modify, delete): 9781581805635 

## Resources
- Class slides
- https://docs.streamlit.io/develop/api-reference/widgets/st.button
- https://docs.streamlit.io/
- https://stackoverflow.com/questions/47361342/python-mysql-transactions-rollback-not-working
