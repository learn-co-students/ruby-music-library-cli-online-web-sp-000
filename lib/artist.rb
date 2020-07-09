require 'pry'

class Artist

  # # extend Memorable
  # extend Findable::ClassMethods
  # include Findable::InstanceMethods
  # # extend Findable
  # # include Paramable


attr_accessor :name, :songs
@@all = []


def initialize(name)

  @name = name
  @songs = []
  save
end

def save
  @@all << self
end

def self.all
  return @@all
end


def self.create(name)
return self.new(name)
end

def self.destroy_all
@@all.clear
end


def add_song(song)
#   # Artist.find_or_create_by_name
  unless (@songs.include?(song)) || !(song.artist == nil)
#   # # if !!song.artist == false
#
  @songs << song
    song.artist = self
  end
  
    # song.artist = self
    # self.songs << song
  # end
  # @songs << song
# end
end
#
# def songs
#   return @songs
#   # @songs = Song.all.select {|song| song.artist == self}
#
# end
#
# def self.find_or_create_by_name(name)
#   found = @@all.find {|artist|  artist.name == name}
#   found ? found : Artist.new(name)
# end
#
# def print_songs
#   songs
#   @songs.each {|track|
#     puts track.name
#   }
# end

end
