from flask import Flask, jsonify
import os
import mysql.connector

app = Flask(__name__)

# Create a database connection
conn = mysql.connector.connect(
        user=os.getenv('DB_USER'),
        password=os.getenv('DB_PASSWORD'),
        host=os.getenv('DB_HOST'),
        database=os.getenv('DB_DATABASE'))

# Define a route for the home page
@app.route('/')
def home():
    # Call the get_user function to retrieve user data from the database
    user = get_user()
    # Convert the user data to a JSON response using the jsonify function
    return jsonify(user)

# Define a function to retrieve user data from the database
def get_user():
    # Create a new cursor object
    cursor = conn.cursor()
    # Execute a SQL query to retrieve the first user from the users table
    query = ('SELECT * FROM users LIMIT 1')
    cursor.execute(query)
    # Retrieve the result of the query
    result = cursor.fetchone()
    # Close the cursor to free up resources
    cursor.close()
    # Return the user data
    return result

# Start the Flask application on port 3001
if __name__ == '__main__':
    app.run(host='0.0.0.0', port=os.getenv('SERVER_PORT'))