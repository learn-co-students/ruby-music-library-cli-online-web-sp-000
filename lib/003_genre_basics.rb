require_relative "./findable_module.rb"

class Genre
  extend Concerns::Findable
attr_reader :name
@@all = []

def initialize(name)
  @name = name
  @songs = []
end
def artists
  all_artists = []
  @songs.each do |song|
   all_artists << song.artist
 end
 all_artists.uniq
end
def songs
  @songs
end

def name=(name)
  @name = name
end
def self.all
  @@all
end
def self.destroy_all
  @@all.clear
end
def save
  @@all << self
end
def self.create(name)
  genre = self.new(name)
  genre.save
  genre
end



end
