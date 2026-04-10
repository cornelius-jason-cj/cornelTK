#!/bin/bash

# Start login-server and char-server in the background
./login-server &
login_server_pid=$!

./char-server &
char_server_pid=$!

./save-server &
save_server_pid=$!

# Function to check if the login server is up
check_login_server() {
    # Check if the login-server is listening on port 2000
    nc -z localhost 2000
}

# Function to check if the char-server is up
check_char_server() {
    # Check if the char-server is listening on port 2005
    nc -z localhost 2005
}

# Wait for the login server to confirm connection
echo "Waiting for login server to start..."
while ! check_login_server; do
    sleep 2
done

echo "Login server is up. Waiting for char-server to start..."

# Wait for the char-server to confirm connection
while ! check_char_server; do
    sleep 2
done

echo "Char-server is up. Starting map-server..."

# Start map-server
./map-server &

# Optionally, wait for all background processes to finish
wait $login_server_pid
wait $char_server_pid

