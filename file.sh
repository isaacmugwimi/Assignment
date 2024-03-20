#!/bin/bash

# This is a Function to calculate basic pay
calculate_basic_pay() {
    local hours_worked=$1
    local rate_per_hour=$2

    basic_pay=$(echo "scale=2; $hours_worked * $rate_per_hour" | bc)
}

# This is a Function to calculate tax based on basic pay
calculate_tax() {
    local basic_pay=$1

    if (( $(echo "$basic_pay > 70000" | bc -l) )); then
        tax=$(echo "scale=2; 0.25 * $basic_pay" | bc)
    elif (( $(echo "$basic_pay >= 15000 && $basic_pay <= 20000" | bc -l) )); then
        tax=$(echo "scale=2; 0.20 * $basic_pay" | bc)
    else
        tax=$(echo "scale=2; 0.15 * $basic_pay" | bc)
    fi
}

# This is a Function to calculate net pay
calculate_net_pay() {
    net_pay=$(echo "scale=2; $basic_pay - $tax" | bc)
}

# This is a Main script starts here
read -p "Enter employee name: " employee_name
read -p "Enter hours worked: " hours_worked
read -p "Enter rate per hour: " rate_per_hour

calculate_basic_pay $hours_worked $rate_per_hour
calculate_tax $basic_pay
calculate_net_pay

# This is a Print the salary statement
echo "Employee Name: $employee_name"
echo "Basic Pay: $basic_pay"
echo "Tax: $tax"
echo "Net Pay: $net_pay"
