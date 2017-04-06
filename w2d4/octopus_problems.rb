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
