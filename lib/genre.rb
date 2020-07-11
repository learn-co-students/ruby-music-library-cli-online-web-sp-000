require 'pry'


class Genre


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

def songs
  return @songs
end

def add_song(song)
  unless !(song.genre == nil)
    song.genre = self
  end

  unless (@songs.include?(song))
    @songs << song
  end
end

def artists
  @artists = []
  @songs = Song.all.select {|song| song.genre == self}
  @songs.each {|song|  @artists << song.artist   }
  @artists.uniq!
  return @artists
end


def self.all
  return @@all
end

end
