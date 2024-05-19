# welcome.py
import streamlit as st

# Welcome page, this is the first GUI page where user starts interacting with the Bank App
def welcome_page():

    # Apply CSS styling for background color and rounded border
    st.markdown("""
                <style>
                    .welcome-container { background-color: #37b9f7; padding: 10px; border-radius: 0px; width: 50%; margin: 0 auto; !important}
                </style>
                """, unsafe_allow_html=True)

    # Create a container for the welcome content with the specified class
    with st.container():

        st.markdown("""
            <style>
                .small-title {
                    font-size: 40px; /* Adjust the font size as needed */
                    font-weight: bold;
                    text-align: center;
                    color: #151151;
                    margin-top: 20px;
                }
            </style>
            <div class='small-title'>Welcome To UCB BANK Project App</div>
                    """, unsafe_allow_html=True)

        col1, col2, col3 = st.columns([1, 1, 1])
        with col2:
            st.image("images/bank.jpeg", width=400)

        col1, col2, col3 = st.columns([4, 2, 3])
        with col2:
            if st.button('Bank Admin Login'):
                # Update the session state to trigger the login page display
                st.session_state['current_page'] = 'Login'
                # rerun the UI page to reset the session state
                st.rerun()

        # Close the container with the specified class
        st.markdown('</div>', unsafe_allow_html=True)
        st.markdown('<div class="welcome-container">', unsafe_allow_html=True)
        st.markdown('</div>', unsafe_allow_html=True)

