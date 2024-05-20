import streamlit as st
from database_class import DatabaseConnector  # Ensure this import is correct based on your project structure
from decimal import Decimal

class Account:
    def __init__(self):
        self.__db = DatabaseConnector()
        self.__db.connect()
        self.apply_styles()

    def apply_styles(self):
        css_style = """
        <style href="profile.css">        
            .card {
                display: flex; flex-direction: row; justify-content: space-between;
                align-items: flex-start; border-radius: 20px; padding: 10px; box-shadow: 0px 0px 5px rgba(0, 0, 0, 0.2);
                margin: 0 auto; width: 80%; background: rgb(40,0,88);
                background: linear-gradient(145deg, rgba(40,0,88,1) 40%, rgba(77,0,0,1) 99%);
            }
            
            .left-container {
                background: linear-gradient(to right, #2a4d4f, #000000);
                flex: 1; display: flex; flex-direction: column; align-items: center;
                padding: 10px; margin: 10px; border-radius: 20px;
                box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
            }
            
            .right-container {
                background: linear-gradient(to left, #434343, #000000);
                flex: 2; padding: 30px 40px; margin: 10px; border-radius: 20px;
                box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
            }
            
            .gradienttext {
                background-image: linear-gradient(to right, #ee00ff 0%, #fbff00 100%);
                color: transparent; font-size: 2rem; text-align: center;
                -webkit-background-clip: text;  
            }
            .h1 { font-size: 2rem; }
            .h2 {
                font-size: 1.5rem; margin-bottom: 25px; text-align: center; color: transparent;
                background-image: linear-gradient(to right, #ee00ff 0%, #fbff00 100%);
                -webkit-background-clip: text;
            }
            .h3 { text-align: center; font-size: 1.75rem; margin-bottom: 5px; }
            .h4 { font-size: 1.5em; margin-bottom: 20px; color: #ff4b4b; background-color: #282828; padding: 5px 20px; }
            .details { color: yellowgreen; padding-left: 10px; }
            .profile_box { background-color: #282828; border-radius: 10px !important; padding: 10px; }
            
            /* Responsive styles */
            @media (max-width: 1024px) {
                .card { flex-direction: column;  width: 90%; }
                .left-container, .right-container { max-width: 100%; margin: 10px 0; padding: 20px; }
                .gradienttext { font-size: 1.75rem; }
                .h1 { font-size: 1.6rem; }
                .h2 { font-size: 1.25rem; }
                .h3 { font-size: 1.2rem; }
                .h4 { font-size: 1rem; }
                .profile_box { padding: 10px; }
            }
            
            @media (max-width: 768px) {
                .card { width: 95%; }
                .left-container, .right-container { padding: 15px; }
                .gradienttext { font-size: 1.5rem; }
                .h1 { font-size: 1.em; }
                .h2 { font-size: 1.2rem; }
                .h3 { font-size: 1rem; }
                .h4 { font-size: 0.8rem; }
                .profile_box { padding: 8px; }
            }
            
            @media (max-width: 480px) {
                .card { width: 100%; }
                .left-container, .right-container { padding: 10px; }
                .gradienttext { font-size: 1.2rem; }
                .h1 { font-size: 1.2rem; }
                .h2 { font-size: 1rem; }
                .h3 { font-size: 0.8rem; }
                .h4 { font-size: 0.6rem; }
                .profile_box { padding: 5px; }
                .details { font-size: 0.75rem; }
            }
        </style>
        """
        st.markdown(css_style, unsafe_allow_html=True)

    # Fetching account details from database and Displaying it using HTML and CSS
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

            # Store details in session state
            st.session_state['account_number'] = account_number
            st.session_state['account_type'] = account_type
            st.session_state['total_balance'] = total_balance


            # Profile Card to display account details of the selected customer
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
            st.error("Account not found.")

    def search_account(self):
        st.write("""
                    <h3 style="color: #37B9F7; text-align: center;">Search Account to do Transactions</h3>
                """, unsafe_allow_html=True)
        account_number = st.text_input("Enter account number to search:", "")

        if st.button("Search"):

            if account_number:
                result = self.__db.search_account(account_number) # searching account information in database
                self.display_account_details(result)
            else:
                st.error("Please enter an account number.") # if account number is incorrect then exception

    # Hiding actual code here and just grabbing the method to select the account for further activities on the given code.
    def select_account(self):
        self.search_account()


# Subclass of Account class and overriding Withdraw Class
class SavingsAccount(Account):
    def withdraw(self, amount):
        fee = Decimal('0.00')
        if amount > 1000: # verifying Transaction fee for savings account withdrawal
            fee = amount * Decimal('0.02') # Adding Transaction fee for savings account withdrawal
        return amount + fee # returning Transaction fee of savings account withdrawal fee to the withdraw method

# Subclass of Account class and overriding Withdraw Class
class CurrentAccount(Account):
    def withdraw(self, amount):
        fee = Decimal('0.00')
        if amount > 5000: # verifying Transaction fee for current account withdrawal
            fee = amount * Decimal('0.02') # Adding Transaction fee for current account withdrawal
        return amount + fee # returning Transaction fee of current account withdrawal fee to the withdraw method


