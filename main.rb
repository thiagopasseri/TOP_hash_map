require_relative 'lib/linked_list'
require_relative 'lib/node'
require_relative 'lib/hash_map'




test = HashMap.new


test.set('apple', 'red')
test.set('apple', 'red')
test.set('apple', 'red')


test.set('banana', 'yellow')
test.set('carrot', 'orange')
test.set('dog', 'brown')
test.set('elephant', 'gray')
test.set('frog', 'green')
test.set('grape', 'purple')
test.set('hat', 'black')
test.set('ice cream', 'white')
test.set('jacket', 'blue')
test.set('kite', 'pink')
test.set('lion', 'golden')

test.set('1', '1')

# puts test
# puts test.get("grape")

# test.set('b', '2')
# test.set('c', '3')
# test.set('d', '4')
# test.set('e', '5')
# test.set('f', '6')


p test.keys
p test.values
# test.remove("1")
# test.remove("dog")

# puts test

# puts test.size
# p test.to_array

# p test.array_list