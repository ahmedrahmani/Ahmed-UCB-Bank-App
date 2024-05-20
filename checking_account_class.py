# In checking_account_class.py
import streamlit as st
import pandas as pd
from database_class import DatabaseConnector
class CheckingAccount:
    def __init__(self):
        # Using access modifiers to protect the scope of this variable
        self.__db = DatabaseConnector()
        self.__db.connect()  # Call the connect method to establish the database connection
        st.write("""
                    <h3 style="color: #37B9F7; text-align: center; margin-bottom: 40px;">Transactions of The Account</h3>
                """, unsafe_allow_html=True)

    def check_this_account(self):
        if 'account_number' in st.session_state:
            account_number = st.session_state['account_number']
            c1, c2, c3 = st.columns([3,4,3])
            with c2:
                st.info(f"Transactions for Account Number : {account_number}")

            # Displaying Updated Transactions of the selected account from the database using pandas dataframe
            transactions = self.__db.fetch_transactions(account_number)
            if transactions:
                df = pd.DataFrame(transactions) # Pandas as "pd" used to show data in dataframes
                df['account_number'] = df['account_number'].astype(str) # Converting account number from integer to a string for better user interactivity
                df['date_time'] = df['date_time'].dt.strftime('%Y-%m-%d')  # Formating date time in YYYY-MM-DD format
                df['amount'] = df['amount'].apply(lambda x: "£ {:,.2f}".format(x)) # formating amount in currency format
                st.dataframe(df, width=1200) # Dataframe in full-width for better visibility
            else:
                st.write("No transactions found for this account.") # Exception when no data found in the data table
        else:
            st.error("Please select an account to view transactions.") # Exception when there's no account number found in the session state

