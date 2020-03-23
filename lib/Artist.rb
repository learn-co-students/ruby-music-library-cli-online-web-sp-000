require 'pry'


class Artist 

extend Concerns::Findable 
attr_accessor :name, :song

@@all = []

def initialize(name)
  @name = name
  @songs = songs 
  @songs = []
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

def self.create(artist)
  artist = Artist.new(artist)
  artist.save
  artist
end

def songs
  @songs
end


def add_song(song)
  song.artist = self unless song.artist == self 
  @songs << song unless @songs.include?(song)
end

def genres
  songs.collect {|song|song.genre}.uniq 
end

end
