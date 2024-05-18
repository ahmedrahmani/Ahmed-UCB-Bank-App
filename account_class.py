import streamlit as st
from database_class import DatabaseConnector  # Ensure this import is correct based on your project structure
from decimal import Decimal

class Account:
    def __init__(self):
        self.db = DatabaseConnector()
        self.db.connect()
        self.apply_styles()
    def apply_styles(self):
        css_style = """
        <style href="profile.css">
        
        </style>
        """
        st.markdown(css_style, unsafe_allow_html=True)
    def display_account_details(self, result):
        if result:
            # Dynamically generate the profile card HTML with account details
            account_id = result[0]
            account_number = result[1]
            customer_name = result[2]
            email_ID = result[3]
            phone_number = result[4]
            account_type = result[5]
            total_balance = result[6]
            customer_address = result[7]
            created_on = result[8]

            # Store in session state
            st.session_state['account_number'] = account_number
            st.session_state['account_type'] = account_type
            st.session_state['total_balance'] = total_balance


            profile_card_html = f"""
            <div class="card">
              <div class="left-container">
                <p class="gradienttext h1">{customer_name}</p>
                
            
              </div>
              <div class="right-container">
                <p class="h2">Profile Details</p>
                <div class="profile_box">
                    <p class="h4"><span class="list_item"><strong>Account ID:</strong></span><span class="details"> {account_id}</span></p>
                    <p class="h4"><strong>Account Type:</strong><span class="details"> {account_type} Account</span></p>
                    <p class="h4"><strong>Account Number:</strong><span class="details"> {account_number}</span></p>
                    <p class="h4"><strong>Email ID:</strong><span class="details"> {email_ID}</span></p>
                    <p class="h4"><strong>Phone Number:</strong><span class="details"> {phone_number}</span></p>
                    <p class="h4"><strong>Total Balance:</strong><span class="details"> {total_balance}</span></p>
                    <p class="h4"><strong>Customer Address:</strong><span class="details"> {customer_address}</span></p>
                    <p class="h4"><strong>Created On:</strong><span class="details"> {created_on}</span></p>
                </div>
              </div>
            </div>
            """
            st.markdown(profile_card_html, unsafe_allow_html=True)
        else:
            st.write("Account not found.")

    def search_account(self):
        st.write("""
                    <h3 style="color: #37B9F7; text-align: center;">Search Account to do Transactions</h3>
                """, unsafe_allow_html=True)
        account_number = st.text_input("Enter account number to search:", "")

        if st.button("Search"):

            if account_number:
                result = self.db.search_account(account_number)
                self.display_account_details(result)
            else:
                st.error("Please enter an account number.")

    def select_account(self):
        self.search_account()


class SavingsAccount(Account):
    def withdraw(self, amount):
        fee = Decimal('0.00')
        if amount > 1000:
            fee = amount * Decimal('0.02')
        return amount + fee

class CurrentAccount(Account):
    def withdraw(self, amount):
        fee = Decimal('0.00')
        if amount > 5000:
            fee = amount * Decimal('0.02')
        return amount + fee


