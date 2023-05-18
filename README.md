# Linked List in Ruby

Implementation of singly Linked List data structure. This implementation contains `#append`, `#prepend`, `#size`, `#head`, `#tail`, `#at`, `#shift`, `#pop`, `#contains?`, `#find`, `#to_s`, `#insert_at` and `#remove_at` methods.

## `#append(value)`
Method that takes *value* as an argument and appends that *value* to the end of the Linked List,

## `#prepend(value)`
Method that takes *value* as an argument and prepends that *value* to the beginning of the Linked List,

## `#size`
Method that returns number of nodes inside of the Linked List.

## `#head`
Method that returns head node of the Linked List.

## `#tail`
Method that returns tail node of the Linked List.

## `#at(index)`
Method that takes *index* as an argument, finds and returns node at the *index* of the Linked List.

## `#shift`
Method that removes first node in the Linked List.

## `#pop`
Method that removes last node in the Linked List.

## `#contains?(value)`
Method that takes *value* as an argument, and checks if Linked List contains *value*. If it does, returns true, if not
returns false.

## `#find(value)`
Method that takes *value* as an argument, and finds that *value* inside Linked List. If *value* doesn't exist in Linked List, error is returned.

## `#to_s`
Method that returns Linked List in string format, formatted as (value) -> (value) -> ... -> (value) -> nil

## `#insert_at(value, index)`
Method that takes *value* and *index* as argument and inserts *value* to the position represented by *index*. There are 3 edge cases. If *index* is larger than the size of the Linked List, returns error. If *index* is 0 prepends *value* to the beginning of the Linked List. If *index* is the same as the size of Linked List, appends *value* to the end of the Linked List. 

## `#remove_at(index)`
Method that takes *index* as an argument, and removes element that is in position represented by *index*. If *index* is larger than the size of the Linked List, error is returned.
