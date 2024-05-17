import streamlit as st
from decimal import Decimal
from database_class import DatabaseConnector

class FundTransfer:
    def __init__(self):
        self.db_connector = DatabaseConnector()
        self.db_connector.connect()
        st.write("""
                    <h3 style="color: #37B9F7; text-align: center; margin-bottom: 40px;">Transfer Funds Form</h3>
                """, unsafe_allow_html=True)

    def perform_fund_transfer(self):
        if 'account_number' in st.session_state:
            sender_account_number = st.session_state['account_number']
            total_balance = Decimal(st.session_state['total_balance'])
            account_type = st.session_state['account_type']


            col1, col2, col3 = st.columns([1, 1, 1])
            with col1:
                st.info(f"Senders Account Number: {sender_account_number}")
            with col2:
                st.success(f"Account Type: {account_type}")
            with col3:
                st.error(f"Current Balance: £{total_balance:.2f}")

            with st.form("fund_transfer_form"):
                receiver_account_number = st.text_input("Enter receiver's account number")
                transfer_amount = st.number_input("Enter transfer amount", min_value=0.01, format="%.2f")
                transfer_button = st.form_submit_button("Transfer Funds")

                if transfer_button:
                    # Verify the receiver's account exists
                    receiver_account = self.db_connector.search_account(receiver_account_number)
                    if receiver_account is None:
                        st.error("Receiver's account number not found.")
                        return

                    # Check if the sender has enough balance
                    if total_balance < transfer_amount:
                        st.error("Insufficient funds.")
                        return

                    # Perform the transfer using the consolidated transaction method
                    if self.db_connector.transfer_transactions(sender_account_number, receiver_account_number, transfer_amount):
                        st.success("Transfer successful.")
                    else:
                        st.error("Transfer failed. Please try again.")
        else:
            st.error("Please select an account to view transactions.")