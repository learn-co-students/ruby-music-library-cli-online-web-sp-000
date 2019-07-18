
require 'pry'
class Song
attr_accessor :name, :genre
attr_reader :artist
@@all = []

def initialize(name, artist = nil)
  @name = name
  # @artist = artist
  self.artist= artist if artist != nil
end

def artist=(artist)
  @artist = artist
  artist.add_song(self)
  # binding.pry
end
def artist
  @artist
end

def self.create(name)
   song = self.new(name)
   song.save
   song
end

def self.all
  @@all
end
def save
  @@all << self
end
def self.destroy_all
  @@all.clear
end


end
