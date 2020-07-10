require 'pry'

class Artist

  # # extend Memorable
  extend Concerns::Findable
  include Concerns::InstanceMethods
  extend Concerns
  # # include Paramable


attr_accessor :name, :songs

@@all = []


def initialize(name)

  @name = name
  @songs = []
  save
end

# def save
#   @@all << self
# end

def self.all
  return @@all
end


# def self.create(name)
# return self.new(name)
# end

# def self.destroy_all
# @@all.clear
# end

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
