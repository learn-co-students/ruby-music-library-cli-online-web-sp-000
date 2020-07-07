require 'pry'


class Song

  extend Memorable
  extend Memorable::ClassMethods
  include Memorable::InstanceMethods
  extend Findable
  include Paramable

  attr_accessor :name
  attr_reader :artist

 @@all = []

def initialize(name)
  @name = name
  @artist = nil
  save
end

def save
  @@all << self
end
# def name=(name)
#   @name = name
# end

def artist=(artist)
  @artist = artist
end


def self.all
  return @@all
end

def self.new_by_filename(filename)
  parsed_filename = filename.split(" - ")
  song_name = parsed_filename[1]
  Song.new(song_name)
  song_name.artist_name = parsed_filename[0]
  return song_name

    # song = self.new(filename.split(" - ")[1])

    # @artist.add_song(this_song)
  end



  def artist_name=(name)
      self.artist = (Artist.find_or_create_by_name(name))
      self.artist.add_song(self)
  end

end
