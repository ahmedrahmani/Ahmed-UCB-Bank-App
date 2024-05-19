import streamlit as st
from streamlit_option_menu import option_menu
import mysql.connector
from database_class import DatabaseConnector
from account_class import Account
from deposit_class import Deposit
from withdraw_class import Withdraw
from fund_transfer_class import FundTransfer
from checking_account_class import CheckingAccount
from bank_class import Bank

class BankApp:
    def __init__(self):
        super().__init__()
        self.__db = DatabaseConnector()
        self.__db.connect()


    def navigation(self):
        with st.sidebar:
            app = option_menu(
                menu_title='UCB Bank',
                options=['Bank', 'Select Account','Deposit','Withdraw','Fund Transfer','Check Account'],
                icons=['bank', 'person-square','upload','download','arrows-expand-vertical','wallet'],
                menu_icon='list',  # Changed to a valid icon
                default_index=0,
                styles={
                    "container": {"padding": "16px", "background-color": "#fcfcfc"},
                    "icon": {"color": "black", "font-size": "16px"},
                }
            )

        if app == "Bank":
            bank = Bank()
            bank.account_number_form()
            bank.create_account_form() #create new account form

        if app == "Select Account":
            account = Account()
            account.select_account() #Search in the search-box and select account

        if app == "Deposit":
            deposit = Deposit(self.__db)
            deposit.perform_deposit() #Deposit View of the app

        if app == "Withdraw":
            withdraw = Withdraw(self.__db)
            withdraw.perform_withdraw() #Withdraw View of the app

        if app == "Fund Transfer":
            fund_transaction = FundTransfer()
            fund_transaction.perform_fund_transfer() #Fund Transfer View of the app

        if app == "Check Account":
            check_account = CheckingAccount()
            check_account.check_this_account() #Checking account transactions view of the account

    def __del__(self):
        self.__db.disconnect() #database disconnection after fetching records


if __name__ == "__main__":
    bank_app = BankApp()
    bank_app.navigation()

