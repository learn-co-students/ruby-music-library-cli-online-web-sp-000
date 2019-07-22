require_relative "./findable_module.rb"

class Artist
  extend Concerns::Findable
attr_reader :name, :songs, :genres
@@all = []

def initialize(name)
  @name = name
  @songs = []
end
def genres
  all_genres = []
    @songs.each do |song|
    all_genres << song.genre
  end
   all_genres.uniq
end


def add_song(song)
  # song = Song.new(name, self)
  song.artist = self if !song.artist
  @songs << song if !@songs.include?(song)
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
  artist = self.new(name)
  artist.save
  artist
end



end
