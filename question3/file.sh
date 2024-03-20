#!/bin/bash

# Prompt the user to enter CustomerID, CustomerName, and UnitConsumed
read -p "Enter Customer ID: " customer_id
read -p "Enter Customer Name: " customer_name
read -p "Enter Units Consumed: " units_consumed

# Initialize variables for charges per unit
charge_1=120
charge_2=150
charge_3=180
charge_4=200

# Calculate total bill based on units consumed
if [ $units_consumed -lt 200 ]; then
    total_bill=$(( units_consumed * charge_1 ))
elif [ $units_consumed -ge 200 ] && [ $units_consumed -lt 400 ]; then
    total_bill=$(( units_consumed * charge_2 ))
elif [ $units_consumed -ge 400 ] && [ $units_consumed -lt 600 ]; then
    total_bill=$(( units_consumed * charge_3 ))
else
    total_bill=$(( units_consumed * charge_4 ))
fi

# Display the total bill
echo "Customer ID: $customer_id"
echo "Customer Name: $customer_name"
echo "Units Consumed: $units_consumed"
echo "Total Bill: Ksh $total_bill"
