require 'pry'


class Song

  extend Concerns::Findable
  include Concerns::InstanceMethods
  extend Concerns

  attr_accessor :name, :artist, :genre


 @@all = []



def initialize(name, new_artist = nil, new_genre = nil)
  @name = name
  unless new_artist == nil
    self.artist = new_artist
  end
  unless new_genre == nil
    self.genre = new_genre
  end
  save
end

def artist=(new_artist)
  @artist = new_artist
  new_artist.add_song(self)
end

def genre=(new_genre)
  @genre = new_genre
  new_genre.add_song(self)
end

def self.all
  return @@all
end

def self.new_from_filename(filename)
  parsed_filename = parse_filename(filename)
  artist_name = parsed_filename[0]
  song_name = parsed_filename[1]
  genre_name = parsed_filename[2].chomp(".mp3")

  artist_object = Artist.find_or_create_by_name(artist_name)
  genre_object = Genre.find_or_create_by_name(genre_name)
  Song.new(song_name, artist_object, genre_object)
end

def self.create_from_filename(filename)
  Song.new_from_filename(filename)
end

  def artist_name=(name)
      self.artist = (Artist.find_or_create_by_name(name))
      self.artist.add_song(self)
  end

  def genre_name=(name)
     self.genre = (Genre.find_or_create_by_name(name))
     self.genre.add_song(self)
  end

end
