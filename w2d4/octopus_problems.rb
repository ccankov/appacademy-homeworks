FISH = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

def sluggish_octopus(fish)
  longest_fish = ''
  fish.each do |fish1|
    longest_fish = true
    fish.each do |fish2|
      longest_fish = false if fish2.length > fish1.length
    end
    return fish1 if longest_fish
  end
end

def dominant_octopus(fish)

  def mergesort(arr, &prc)
    return arr if arr.length < 2
    prc ||= Proc.new { |x, y| x <=> y }
    midpoint = arr.length / 2
    left = mergesort(arr[0...midpoint], &prc)
    right = mergesort(arr[midpoint...arr.length], &prc)
    merge(left, right, &prc)
  end

  def merge(left, right, &prc)
    merged = []
    until left.empty? || right.empty?
      if (prc.call(left.first, right.first) == 1)
        merged << right.shift
      else
        merged << left.shift
      end
    end
    merged + left + right
  end

  sorted_fish = mergesort(fish) { |fish1, fish2| fish1.length <=> fish2.length }

  sorted_fish.last
end

def clever_octopus(fish)
  longest_fish = ''
  fish.each { |fish| longest_fish = fish if fish.length > longest_fish.length }
  longest_fish
end

p sluggish_octopus(FISH) == 'fiiiissshhhhhh'
p dominant_octopus(FISH) == 'fiiiissshhhhhh'
p clever_octopus(FISH) == 'fiiiissshhhhhh'
