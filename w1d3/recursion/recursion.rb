# Exercise 1
def sum_to(n)
  return nil if n < 1
  return n if n == 1
  n + sum_to(n - 1)
end

puts 'sum_to tests:'
puts sum_to(5) == 15
puts sum_to(1) == 1
puts sum_to(9) == 45
puts sum_to(-8).nil?

# Exercise 2
def add_numbers(nums_array)
  return nums_array.first if nums_array.length <= 1
  nums_array.first + add_numbers(nums_array[1..-1])
end

puts 'add_numbers tests:'
puts add_numbers([1, 2, 3, 4]) == 10
puts add_numbers([3]) == 3
puts add_numbers([-80, 34, 7]) == -39
puts add_numbers([]).nil?

# Exercise 3
def gamma_fnc(n)
  return nil if n < 1
  return 1 if n == 1
  (n - 1) * gamma_fnc(n - 1)
end

puts 'gamma_fnc tests:'
puts gamma_fnc(0).nil?
puts gamma_fnc(1) == 1
puts gamma_fnc(4) == 6
puts gamma_fnc(8) == 5040

# Exercise 4
def ice_cream_shop(flavors, favorite)
  return false if flavors.empty?
  return true if flavors.first == favorite
  ice_cream_shop(flavors[1..-1], favorite)
end

puts 'ice_cream_shop tests:'
puts ice_cream_shop(%w(vanilla strawberry), 'blue moon') == false
puts ice_cream_shop(['pistachio', 'green tea', 'chocolate', 'mint chip'],
                    'green tea')
puts ice_cream_shop(['cookies n cream', 'blue moon', 'superman',
                     'honey lavender', 'sea salt caramel'],
                    'pistachio') == false
puts ice_cream_shop(['moose tracks'], 'moose tracks')
puts ice_cream_shop([], 'honey lavender') == false

# Exercise 5
def reverse(string)
  return string if string.length < 2
  reverse(string[1..-1]) + string[0]
end

puts 'reverse tests:'
puts reverse('house') == 'esuoh'
puts reverse('dog') == 'god'
puts reverse('atom') == 'mota'
puts reverse('q') == 'q'
puts reverse('id') == 'di'
puts reverse('') == ''
