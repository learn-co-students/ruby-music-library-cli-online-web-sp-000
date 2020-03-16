require 'pry'

class Song

extend Concerns::Findable

@@all = []
attr_accessor :name, :genre
attr_reader :artist

def artist=(artist)
artist.add_song(self)
@artist = artist
end

def genre=(genre)

genre.add_song(self)
@genre = genre
end


def initialize(name = nil, artist = nil, genre = nil)
@name = name

self.save
  if artist != nil
  self.artist = artist
  artist.genres << self.genre
  end

  if genre != nil
    self.genre = genre
    genre.artists << self.artist
  end
end



def save
  @@all << self
end

def self.create(name = nil, artist = nil, genre = nil)
song = Song.new(name, artist, genre)
song.save
song
end

def self.new_from_filename(filename)

parsed = filename.gsub(".mp3", "").split(" - ")

song = Song.find_or_create_by_name(parsed[1])
artist = Artist.find_or_create_by_name (parsed[0])
genre = Genre.find_or_create_by_name(parsed[2])
song.artist = artist
song.genre = genre
song
end

def self.create_from_filename(filename)
song = Song.new_from_filename(filename)
song.save
end

def self.all
@@all.uniq
end

def self.destroy_all
@@all.clear
end


end
