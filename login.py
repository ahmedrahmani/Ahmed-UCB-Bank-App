# login.py
import streamlit as st
from auth_controller import authenticate_user

# Login form
def login_page():

    st.markdown("""
                <div style="margin-top: 100px;"></div>
                """, unsafe_allow_html=True)

    # Display login form in the center using columns technique
    col1, col2, col3 = st.columns([1, 1, 1])
    with col2:

        with st.form("login_form"):
            col1, col2, col3 = st.columns([1, 3, 1])

            with col2:
                # Login Form header image for better UI designing
                st.image("images/login_img.jpeg", width=200)

            username = st.text_input('Username', key="username")
            password = st.text_input('Password', type='password', key="password")

            if st.form_submit_button('Login'):

                # Call the authentication function from auth_controller.py
                user_authenticated, user_details = authenticate_user(username, password)
                if user_authenticated:

                    # if Credentials are correct
                    st.session_state['loggedin'] = True
                    st.session_state['employee_id'] = user_details['employee_id']
                    st.session_state['employee_name'] = user_details['employee_name']

                    # Update the current_page to 'Dashboard'
                    st.session_state['current_page'] = 'Dashboard'
                    st.rerun()
                else:
                    # if Credentials are incorrect
                    st.error("Incorrect details. Enter valid credentials.")