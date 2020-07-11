require 'pry'

class Artist

  extend Concerns::Findable
  include Concerns::InstanceMethods
  extend Concerns


attr_accessor :name, :songs

@@all = []


def initialize(name)
  @name = name
  @songs = []
  save
end

def self.all
  return @@all
end

def genres
  @genres = []
  @songs = Song.all.select {|song| song.artist == self}
  @songs.each {|song|  @genres << song.genre   }
  @genres.uniq!
  return @genres
end

def add_song(song)
unless !(song.artist == nil)
  song.artist = self
end

  unless (@songs.include?(song))
    @songs << song
  end
end
end
