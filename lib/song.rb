require 'pry'


class Song

  # extend Memorable
  extend Findable::ClassMethods
  include Findable::InstanceMethods
  # extend Findable
  # include Paramable

  attr_accessor :name, :artist

 @@all = []



def initialize(name, artist = nil)
  # @name = name
  artist= (new_artist)
  save
end


def save
  @@all << self
end


def artist=(new_artist)
  @artist = new_artist
  new_artist.add_song(self)
  # artist.add_song(self)
  # @artist = artist
  # @artist.songs << self
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
  end



  def artist_name=(name)
      self.artist = (Artist.find_or_create_by_name(name))
      self.artist.add_song(self)
  end

end
