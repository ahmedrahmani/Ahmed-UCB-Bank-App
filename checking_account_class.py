# In checking_account_class.py
import streamlit as st
import pandas as pd
from database_class import DatabaseConnector

class CheckingAccount:
    def __init__(self):
        self.db = DatabaseConnector()
        self.db.connect()  # Call the connect method to establish the database connection

        st.write("""
                    <h3 style="color: #37B9F7; text-align: center; margin-bottom: 40px;">Transactions of The Account</h3>
                """, unsafe_allow_html=True)

    def check_this_account(self):
        if 'account_number' in st.session_state:
            account_number = st.session_state['account_number']

            c1, c2, c3 = st.columns([3,4,3])
            with c2:
                st.info(f"Transactions for Account Number : {account_number}")


            transactions = self.db.fetch_transactions(account_number)
            if transactions:
                df = pd.DataFrame(transactions)
                df['account_number'] = df['account_number'].astype(str)
                df['date_time'] = df['date_time'].dt.strftime('%Y-%m-%d')
                df['amount'] = df['amount'].apply(lambda x: "£ {:,.2f}".format(x))
                st.dataframe(df, width=1200)
            else:
                st.write("No transactions found for this account.")
        else:
            st.error("Please select an account to view transactions.")