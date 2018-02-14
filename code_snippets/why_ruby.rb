
# array with numbers from 1 to 10

numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

# or
numbers = (1..10).to_a

# or
numbers = Range.new(1, 10).to_a


# loop through

numbers.each do |num|
  # puts num
end

# Alternative one-liner:
numbers.each { |num| puts num }


# with index
numbers.each_with_index do |num, index|
  # puts "#{num} @#{index}"
end

# sum
numbers.sum

# doubles

numbers.map { |num|  num * 2 }

# even
even = numbers.select { |num| num % 2 == 0 }
even = numbers.select { |num| num.even? }
even = numbers.select(&:even?)
even = numbers.reject(&:odd?)

# odds

first_greater_than_five = numbers.find {|num| num > 5 }


# all?
[2, 4, 6].all? { |e| e.even? } # returns true

# all?
[2, 3, 6].all? { |e| e.even? } # returns false

# all?
[2, 3, 6].any? { |e| e.even? } # returns true

[3, 4].any?  # returns true
[].any?      # returns false
[nil].any?   # returns false
[false].any? # returns false

# sort

[7, 2, 5].sort                      # returns [2, 5, 7]
['c', 'b', 'a'].sort                # returns ['a', 'b', 'c']

employees.sort_by {|e| e.last_name} # sort your employees by last name
employees.sort_by(&:last_name)      # Alternatively

# loops

10.times { puts "Hello world" }
10.times { |n| puts "Hello world ##{n}" }

until fished
  # do stuff
end

while !fished
  # do stuff
end

loop do
  # do stuff, same as while true
end

# Objects Objects Objects...

"foo".class         # String
1.class             # Integer
1.class.class       # Class
1.class.class.class # Class


if x == z
  # do this
elsif x == y
  # do this
end

unless x == y
  # do this
end

# same as
if x != y
  # do this
end

class Greeter
  def greet(name = nil)
    name ||= 'World'

    "Hello #{name}"
  end
end

greeter = Greeter.new
greeter.greet             # Hello World!
greeter.greet('Portugal') # Hello Portugal!


# Monkey patch String

class String
  def rock!
    "#{self} rocks!"
  end
end

"ruby".rock! "ruby rocks!"

"ruby rocks".capitalize # Ruby rocks
"ruby rocks".upcase # RUBY ROCKS
"ruby rocks".upcase.downcase # rubyrocks
"ruby rocks".split(' ').map(&:capitalize).join(' ')

