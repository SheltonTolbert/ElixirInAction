Elixir in action 

## Modules
Generate a compiled file with `elixirc _filename_`

## Lists
Lists can be modified with the List and Enum Modules

- Lists are linked lists with the following structure [head | tail]
    - [1,2,3] is the same as [1,[2,[3,[4,[]]]]]
- h _list_ will return the head, 1 in the above case
- t _list_ will return the tail, [2,3,4] in the above case
- lists without another list as a tail are called improper lists and have some special use cases. ie: [1 | 'b']

### List tricks 
- pushing to a list can be done using the following syntax: 
    list = [1,2]
    new_list = [0 | list]

### Immutability
- Items in tuples share common memory: 
    t1 = {1,2,3}
    t2 = insert_at(t1,1,5)
        {1,5,2,3}
    There is only one copy of each element in memory, t1 and t2 point to the same locations

- Lists only replace the tail, the head is copied into a new memory location
    
## Maps
	map = %{key => ‘value’, :key => :value}
	$ map[key]
	_’value’_
	$ map[value]
	_nil_
	$ Map.get(map, value, :default_value)
	_:default_value_

	Insert a new element with Map.put(map, key, value)
    
    Atoms can be used as keys and provide the following special syntatic treatment:
    $ map = %{this_is_an_atom: 'atoms are fun'}
    $ map.this_is_an_atom
    _'atoms_are_fun'_ 
    $ map[:this_is_an_atom]
    _'atoms_are_fun'_

    Change a field with the following syntax
    $ map = %{a: 1, b: 2}
    $ %{map | b: 3}
    {a: 1, b: 3}

    The common pattern is to provide all the fields while creating the map, using atoms as keys. 
    If the value for some field isn’t available, you can set it to nil.

## Labmdas
    $anon = fn x -> IO.puts(x)
    $ Enum.each([0,1,2], anon)
    0
    1
    2

    Lambda functions can also be defined with the capture shorthand: 
    $ Enum.each([0,1,2], &IO.puts/1)
    0
    1
    2 

    The capture operator can also be used to shorten custom lambdas:
    $ lambda = fn x, y, z -> x * y + z end
    is the same as:
    $ lambda = &(&1 * &2 + &3)”

    lambdas support closure

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