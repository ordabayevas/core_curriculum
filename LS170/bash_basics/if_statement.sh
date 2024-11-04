string='Dana'

# -n string	Length of string is greater than 0

if [[ -n $string ]]
then
  echo $string length more than 0.
fi

# -z string	Length of string is 0 (string is an empty string)

string_2=''

if [[ -z $string_2 ]]
then
  echo String is empty.
fi

# string_1 = string_2	string_1 is equal to string_2

if [[ $string = $string_2 ]]
then
  echo They are equal.
else
  echo Strings are not the same.
fi

# string_1 != string_2	string_1 is not equal to string_2
if [[ $string != $string_2 ]]
then
  echo They are not equal.
else
  echo Strings are the same.
fi

# integer_1 -eq integer_2

integer_1=5
integer_2=8

if [[ integer_1 -eq integer_2 ]]
then 
  echo they are equal
else
  echo Integer 1 and 2 not equal
fi

# integer_1 -ne integer_2

if [[ integer_1 -ne integer_2 ]]
then
  if [[ integer_1 -eq 5 ]]
  then
    echo It is 5.
  else
    echo It is not 5.
  fi
else
  echo Integer 1 and 2 are equal.
fi

# integer_1 -gt integer_2

if [[ integer_1 -ne integer_2 && integer_2 -gt integer_1 ]]
then
  echo Integer 2 is greater than 8.
fi

# integer_1 -ge integer_2

if [[ integer_1 -ge integer_2 ]]
then
  echo Integer 1 is greater than 8.
else
  echo Integer 2 is greater or not equal to Integer 1.
fi

# integer_1 -lt integer_2

if [[ integer_1 -lt integer_2 ]]
then
  echo Integer 1 is still less than 8.
fi

# integer_1 -le integer_2

if [[ integer_1 -le integer_2 ]]
then
  echo Integer 1 is less than or not equal to Integer 2.
fi

# -e path/to/file	file exists

if [[ -e ./hello_world.sh ]]
then
  echo Hello world file exists.
fi

# -f path/to/file	file exists and is a regular file (not a directory)

if [[ -f ../../codewars/spin_words.rb ]]
then
  echo Spin words is a regular file.
fi

# -d path/to/file	file exists and is a directory

if [[ -d ../bash_basics ]]
then
  echo Bash basics is a directory.
fi