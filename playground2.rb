require_relative "./playground.rb"

class Song
  extend First::Second
  @@all = ["hello"]
  
end

puts Song.all