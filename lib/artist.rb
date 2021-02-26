class Artist
  extend Concerns::Findable
  attr_accessor :name
  attr_reader :songs

  @@all = []

def initialize(name)
  @name = name
  @songs = []
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

def add_song(song)
  song.artist = self if song.artist == nil
  @songs << song if self.songs.include?(song) == false  # Make sure @songs are unique
end

def songs
@songs
end

def genres
  self.songs.collect { |song| song.genre }.uniq
end

end
