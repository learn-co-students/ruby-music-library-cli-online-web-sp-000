require 'pry'

class Artist

extend Concerns::Findable

@@all = []

attr_accessor :name

def initialize(name)
@songs = []
@name = name
self.save
end

def songs
  Song.all.each do |song|
    if song.artist == self && @songs.none?(song) == true
      @songs << song
    end
  end
@songs
end

def add_song(song)
if songs.none?(song) == true && song.artist == nil
  @songs << song
  song.artist = self
end
end

def save
@@all << self
end

def genres
  arr = []
self.songs.each do |song|
  if song.genre != nil
    arr << song.genre
  end
end
arr.uniq
end

def self.create(name)
artist = Artist.new(name)
artist
end

def self.all
@@all.uniq
end

def self.destroy_all
  @@all.clear
end

end
