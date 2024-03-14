#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=periodic_table --no-align --tuples-only -c"



#The element with atomic number 1 is Hydrogen (H). It's a nonmetal, with a mass of 1.008 amu. 
#Hydrogen has a melting point of -259.1 celsius and a boiling point of -252.9 celsius.

#first echo
if [ "$#" -eq 0 ]; then
  echo "Please provide an element as an argument."
else
  if [[ "$1" =~ ^[0-9]+$ ]]; then
    NUMBER=$($PSQL "SELECT atomic_number FROM joined_table WHERE atomic_number = $1")
    NAME=$($PSQL "SELECT name FROM joined_table WHERE atomic_number = $1")
    SYMBOL=$($PSQL "SELECT symbol FROM joined_table WHERE atomic_number = $1")
    ELEMENT=$($PSQL "SELECT element_type FROM joined_table WHERE atomic_number = $1")
    MASS=$($PSQL "SELECT atomic_mass FROM joined_table WHERE atomic_number = $1")
    MELTING=$($PSQL "SELECT melting_point_celsius FROM joined_table WHERE atomic_number = $1")
    BOILING=$($PSQL "SELECT boiling_point_celsius FROM joined_table WHERE atomic_number = $1")
    if [ -z "$NAME" ]; then
     echo "I could not find that element in the database."
    else
      echo "The element with atomic number $NUMBER is $NAME ($SYMBOL). It's a $ELEMENT, with a mass of $MASS amu. $NAME has a melting point of $MELTING celsius and a boiling point of $BOILING celsius."
    fi
  elif [[ "$1" =~ ^[A-Za-z]{1,2}$ ]]; then
    NUMBER=$($PSQL "SELECT atomic_number FROM joined_table WHERE symbol = '$1'")
    NAME=$($PSQL "SELECT name FROM joined_table WHERE symbol = '$1'")
    SYMBOL=$($PSQL "SELECT symbol FROM joined_table WHERE symbol = '$1'")
    ELEMENT=$($PSQL "SELECT element_type FROM joined_table WHERE symbol = '$1'")
    MASS=$($PSQL "SELECT atomic_mass FROM joined_table WHERE symbol = '$1'")
    MELTING=$($PSQL "SELECT melting_point_celsius FROM joined_table WHERE symbol = '$1'")
    BOILING=$($PSQL "SELECT boiling_point_celsius FROM joined_table WHERE symbol = '$1'")
    
    # if no name
    if [ -z "$NAME" ]; then
     echo "I could not find that element in the database."
    else
      echo "The element with atomic number $NUMBER is $NAME ($SYMBOL). It's a $ELEMENT, with a mass of $MASS amu. $NAME has a melting point of $MELTING celsius and a boiling point of $BOILING celsius."
    fi
    
   
  #Well done and couldn't find element
  elif [[ "$1" =~ ^[A-Za-z]{1,}$ ]]; then
    NUMBER=$($PSQL "SELECT atomic_number FROM joined_table WHERE name = '$1'")
    NAME=$($PSQL "SELECT name FROM joined_table WHERE name = '$1'")
    SYMBOL=$($PSQL "SELECT symbol FROM joined_table WHERE name = '$1'")
    ELEMENT=$($PSQL "SELECT element_type FROM joined_table WHERE name = '$1'")
    MASS=$($PSQL "SELECT atomic_mass FROM joined_table WHERE name = '$1'")
    MELTING=$($PSQL "SELECT melting_point_celsius FROM joined_table WHERE name = '$1'")
    BOILING=$($PSQL "SELECT boiling_point_celsius FROM joined_table WHERE name = '$1'")
    if [ -z "$NAME" ]; then
     echo "I could not find that element in the database."
    else
      echo "The element with atomic number $NUMBER is $NAME ($SYMBOL). It's a $ELEMENT, with a mass of $MASS amu. $NAME has a melting point of $MELTING celsius and a boiling point of $BOILING celsius."
    fi
  fi
fi
