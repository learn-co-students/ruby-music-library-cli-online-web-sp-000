require 'pry'


class Genre


  extend Concerns::Findable
  include Concerns::Findable
  extend Concerns
  # # extend Memorable
  # extend Findable::ClassMethods
  # include Findable::InstanceMethods

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

def save
  @@all << self
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

# def self.create(name)
#    return self.new(name)
# end

def self.destroy_all
@@all.clear
end

end
