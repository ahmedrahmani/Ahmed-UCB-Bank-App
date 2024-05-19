import streamlit as st
from decimal import Decimal


class Deposit:
    def __init__(self, db_connector):
        self.__db_connector = db_connector
        st.write("""
                    <h3 style="color: #37B9F7; text-align: center; margin-bottom: 40px;">Deposit Form</h3>
                """, unsafe_allow_html=True)

    def perform_deposit(self):
        if 'account_number' in st.session_state:
            account_number = st.session_state['account_number']
            total_balance = Decimal(st.session_state['total_balance'])
            account_type = st.session_state['account_type']

            col1, col2, col3 = st.columns([1, 1, 1])
            with col1:
                st.info(f"Deposit Account Number: {account_number}")
            with col2:
                st.success(f"Account Type: {account_type}")
            with col3:
                st.error(f"Current Balance: £{total_balance:.2f}")

            with st.form("deposit_form"):
                deposit_amount = st.number_input("Enter deposit amount", min_value=0.01, format="%.2f")
                deposit_button = st.form_submit_button("Deposit")

                # This code runs if Deposit button is clicked
                if deposit_button:
                    if deposit_amount > 0:
                        # Update the total balance in the database
                        success = self.__db_connector.update_balance(account_number,
                                                                     -deposit_amount)  # Negative because the query subtracts
                        if success:
                            # Record the transaction
                            transaction_recorded = self.__db_connector.record_transaction(
                                account_number, deposit_amount, "deposit", "Deposit to account"
                            )
                            if transaction_recorded:
                                # Update session state balance
                                st.session_state['total_balance'] += Decimal(deposit_amount)

                                # Success message display after transaction done successfully
                                success_message = f"""
                                                    <div style='background-color: #36a12a; color: white; font-size: 24px; text-align: center; padding: 10px; border-radius: 15px; width:50%; margin: 20px auto;'>
                                                        <div>Deposited successfully...!</div><div>&nbsp;<div>
                                                        <div>New available amount: <span> <strong> £ {st.session_state['total_balance']:.2f}  </strong></span> </div> 
                                                    </div>
                                                    """
                                st.markdown(success_message, unsafe_allow_html=True)
                            else:
                                st.error("Failed to record transaction.")  # database error message
                        else:
                            st.error("Failed to update balance.")  # database error message
                    else:
                        st.error("Invalid deposit amount.")  # Error Message if deposit amount is incorrect
        else:
            # if account is not in session as selected account for performing deposit
            st.error('Please select an account to view transactions.')
