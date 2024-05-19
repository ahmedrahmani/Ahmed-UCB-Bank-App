# auth_controller.py
from database_class import DatabaseConnector

def authenticate_user(username, password):
    __db = DatabaseConnector()
    __db.connect()

    try:
        # Connect to database and check username and password in 'Employees' table
        cursor = __db.connection.cursor()
        query = "SELECT employee_id, employee_name FROM Employees WHERE employee_username = %s AND employee_password = %s"
        cursor.execute(query, (username, password))
        result = cursor.fetchone()

        # When found then verify the user credentials
        if result:
            employee_id, employee_name = result
            user_details = {
                'employee_id': employee_id,
                'employee_name': employee_name
            }

            return True, user_details
        else:
            return False, {}

    except Exception as e:
        # Database error exception
        print("Error occurred during authentication:", e)
        return False, {}

    finally:
        # Disconnecting the database if try or exception blocks are executed
        __db.disconnect()
