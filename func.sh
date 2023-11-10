#!/bin/bash
# greet() {
#     echo "Hello, $1! Today is $2."
# }

# greet "Alice" "Monday"  # Call greet function with two arguments


## Case statement

fruit="grape"

case $fruit in
    "apple")
        echo "It's an apple."
        ;;
    "banana" | "orange")
        echo "It's a banana or an orange."
        ;;
    "grape")
        echo "It's a grape."
        ;;
    *)
        echo "It's something else."
        ;;
esac