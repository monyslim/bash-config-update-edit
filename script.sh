#!/bin/bash

## create variables
## Define the paths for inventory files
# 1. inventory files
UsersAllowed="allowed_inventory.txt"
UsersNotAllowed="not_allowed_inventory.txt"

# Define the path for the main configuration file
# 2. config file
config_file="web.config"

# Define the path for the temporary configuration file
# 3. temporary config
temp_config_file="temp_config"

if [[ -f $temp_config_file ]]; then
    rm -f $temp_config_file
fi

# Create and initialize the temporary config file with default value
touch $temp_config_file
string=""
echo "AllowUsersLogin=yes" >>$temp_config_file
# Process UsersAllowed
cat_check="UsersAllowed=root"
while read -r line
do
    string+="$line,"
done < $UsersAllowed
echo "$cat_check,$string" >> $temp_config_file

# Process UsersNotAllowed
cat_check="UsersNotAllowed="
string=""
while read -r line
do
    string+="$line,"
done < $UsersNotAllowed
echo "$cat_check,$string" >> $temp_config_file


# Remove the existing config file and replace it with the updated one
rm -f $config_file  
mv $temp_config_file $config_file


# ## create variables
# # 1. inventory file
# inventory_file="inventory.txt"

# # 2. config file
# config_file="web.config"

# # 3. temporary config
# temp_config_file="temp_config"

# if [[ -f $temp_config_file ]]; then
#     rm -f $temp_config_file
# fi
# touch $temp_config_file
# string_allowed=""
# string_not_allowed=""
# cat_check="UsersAllowed=root"

# # Process each line in the inventory file
# while read -r line
# do
#     if [[ "$line" == "James" || "$line" == "John" || "$line" == "Jerry" || "$line" == "Segun" || "$line" == "Mary" || "$line" == "Tade" ]]; then
#         string_allowed+="$line,"
#     else
#         string_not_allowed+="$line "
#     fi
# done < $inventory_file

# # Append the modified content
# echo "$cat_check=$string_allowed" >> $temp_config_file
# echo "UsersNotAllowed=$string_not_allowed" >> $temp_config_file

# # Preserve the existing AllowUsersLogin line
# grep "AllowUsersLogin=yes" $config_file >> $temp_config_file

# rm -f $config_file
# mv $temp_config_file $config_file






