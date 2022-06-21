## Higher Level Types

### Range

A range is an abstraction that allows you to represent a range of numbers.

The syntax is as follows
`$ range = 1...2`

Ranges are enumerable like a list but are implemented using a Map.
This makes range operations O(1) instead of O(n).

### Keyword Lists

A Keyword list is a special list where each element is a tuple consisting of an atom and a value of any type.

The Syntax is as follows:
`$ days = [{:monday, 1}, {:tuesday, 2}, {:wednesday, 3}]`

The Keyword List syntax can be simplified using the following syntax:
`$ days = [monday: 1, tuesday: 2, wednesday: 3]`

Keyword List data is accessed like a map:
`$ days[:monday]`
`1`
or
`$ days.tuesday`
`2`

Since a Keyword List is a just a List, the lookup complexity is still O(n).
