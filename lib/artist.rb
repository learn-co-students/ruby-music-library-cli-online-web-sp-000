class Artist
 attr_accessor :name
 @@all = []

 def initialize(name)
   @name = name
 end

 def self.all
   @@all
 end

 def save
   @@all << self
 end

 def self.destroy_all
   self.all.clear
 end

 def self.create(artist_name)
   artist = self.new(artist_name)
   artist.name = artist_name
   artist.save
   artist
 end
end
