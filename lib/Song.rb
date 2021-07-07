require 'pry'

class Song
  attr_accessor :name, :artist, :genre

  @@all = []

def initialize(name, artist = nil, genre = nil)
    @name = name
  if genre != nil
    self.genre = genre
  end
  if artist != nil
    self.artist = artist
  end
end

def self.all
  @@all
end

def self.destroy_all
  @@all = []
end

def save
  @@all << self
end

def self.create(name)
  self.new(name).tap {|song| song.save}
  # song = Song.new(name)
  # song.save
  # song
end

def artist=(artist)
  @artist = artist
  if !(artist.songs.include?(self))
    artist.add_song(self)
  end
end

def genre=(genre)
  @genre = genre
  if !(genre.songs.include?(self))
      genre.songs << self
  end
end

def self.find_by_name(name)
  self.all.find {|song| song.name == name}
end

def self.find_or_create_by_name(name)
   self.find_by_name(name) || self.create(name)
end

def self.new_from_filename(filename)
  genre_name = filename.split(" - ")[2].chomp(".mp3")
  song_name = filename.split(" - ")[1]
  artist_name = filename.split(" - ")[0]
   artist = Artist.find_or_create_by_name(artist_name)
   genre = Genre.find_or_create_by_name(genre_name)
   song = Song.find_or_create_by_name(song_name)
    song.artist = artist
    song.genre = genre
    song
    #  binding.pry
end

def self.create_from_filename(filename)
  # binding.pry
  Song.new_from_filename(filename)
end


end
