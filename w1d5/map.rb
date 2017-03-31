# Map implementation using Array data type
class Map
  def initialize
    @map_keys = []
    @map_values = []
  end

  def assign(key, value)
    index = @map_keys.index(key)
    if index.nil?
      @map_keys << key
      @map_values << value
    else
      @map_values[index] = value
    end
    nil
  end

  def lookup(key)
    index = @map_keys.index(key)
    index.nil? ? nil : @map_values[index]
  end

  def remove(key)
    index = @map_keys.index(key)
    unless index.nil?
      @map_keys.delete_at(index)
      @map_values.delete_at(index)
    end
    nil
  end

  def show
    map = []
    @map_keys.each_with_index { |key, idx| map << [key, @map_values[idx]] }
    map
  end
end

puts 'Map tests:'
map = Map.new
map.assign(1, 'a')
puts map.show == [[1, 'a']]
map.assign(1, 'b')
puts map.lookup(1) == 'b'
puts map.show == [[1, 'b']]
puts map.lookup(2).nil?
map.assign(2, 'c')
puts map.show == [[1, 'b'], [2, 'c']]
map.remove(2)
puts map.show == [[1, 'b']]
