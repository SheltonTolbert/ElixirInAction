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

## Abstract Data Types 
