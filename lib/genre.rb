class Genre
 attr_accessor :name
 @@all = []

 def initialize(name)
   @name = name
   @songs = []
 end

 def self.all
   @@all
 end

 def save
   @@all << self
 end

def songs
 @songs
end

 def self.destroy_all
   self.all.clear
 end


 def self.create(genre_name)
   genre = self.new(genre_name)
   genre.name = genre_name
   genre.save
   genre
 end
end
