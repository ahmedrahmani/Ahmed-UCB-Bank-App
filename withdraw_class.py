import streamlit as st
from decimal import Decimal
from account_class import SavingsAccount, CurrentAccount

class Withdraw:
    def __init__(self, db_connector):
        self.__db = db_connector # Using Access modifier for database connector property

        st.write("""
                    <h3 style="color: #37B9F7; text-align: center; margin-bottom: 40px;">Withdraw Form</h3>
                """, unsafe_allow_html=True)

    # Code to perform Withdrawal from the selected account
    def perform_withdraw(self):
        if 'account_number' in st.session_state and 'total_balance' in st.session_state and 'account_type' in st.session_state:

            # Taking data from sessions state to utilize in this code
            account_number = st.session_state['account_number']
            total_balance = Decimal(st.session_state['total_balance'])
            account_type = st.session_state['account_type']

            # Displaying selected accounts basic information
            col1, col2, col3 = st.columns([1, 1, 1])
            with col1:
                st.info(f"Withdraw Account Number: {account_number}")
            with col2:
                st.success(f"Account Type: {account_type}")
            with col3:
                st.error(f"Current Balance: £. {total_balance:.2f}")

            # Determine the account class based on the account type
            if account_type == 'savings':
                account = SavingsAccount()
            elif account_type == 'current':
                account = CurrentAccount()
            else:
                st.error("Invalid account type")
                return

            with st.form("withdraw_form"):
                amount = st.number_input("Enter amount to withdraw:", min_value=0.01, step=0.01, format="%.2f")
                amount_decimal = Decimal(amount)

                if st.form_submit_button("Withdraw"):
                    total_withdrawal = account.withdraw(amount_decimal)

                    # Check for insufficient balance in the selected account
                    if total_withdrawal <= total_balance:
                        if self.__db.update_balance(account_number, total_withdrawal) and self.__db.record_transaction(
                                account_number, total_withdrawal, 'withdrawal', 'Withdrawal from ATM'):
                            new_balance = total_balance - total_withdrawal

                            # updating new balance of the account in the session
                            st.session_state['total_balance'] = new_balance

                            # Success message displayed after withdrawal is done successfully without any issue
                            success_message = f"""
                                <div style='background-color: #36a12a; color: white; font-size: 30px; text-align: center; padding: 10px; border-radius: 15px; width:50%; margin: 20px auto;'>
                                    <strong>Amount : </strong> £. {amount_decimal:.2f} <p>withdrawn successfully.</p> 
                                    <strong>New balance is:</strong> £. {new_balance:.2f}.
                                </div>
                                """
                            st.markdown(success_message, unsafe_allow_html=True)
                        else:
                            st.error("Failed to process the withdrawal.")
                    else:
                        st.error("Insufficient funds.")
        else:
            # Exception when there's no account number found in the session state
            st.error("Please select an account to perform a withdrawal.")