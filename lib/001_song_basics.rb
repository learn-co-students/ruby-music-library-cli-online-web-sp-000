
require 'pry'
class Song
attr_accessor :name
attr_reader :artist, :genre
@@all = []

def initialize(name, artist = nil, genre = nil)
  @name = name
  # @artist = artist
  self.artist= artist if artist != nil
  self.genre= genre if genre !=nil
end

def self.find_by_name(name)
  @@all.detect do |song|
    song.name == name
  end
end
def self.find_or_create_by_name(name)
  if !find_by_name(name)
    create(name)
  else find_by_name(name)
  end
end

def self.new_from_filename(song_file)
  file = song_file.gsub(".mp3", "").split(" - ")
   artist = Artist.find_or_create_by_name(file[0])
   genre = Genre.find_or_create_by_name(file[2])
   self.new(file[1], artist, genre)
end

def self.create_from_filename(song_file)
    song = self.new_from_filename(song_file)
    song.save
  end

  def artist=(artist)
  @artist = artist
  artist.add_song(self)
  # binding.pry
end
def genre=(genre)
  @genre = genre
  genre.songs << self unless genre.songs.include?(self)
end
def artist
  @artist
end

def self.create(name)
   song = self.new(name)
   song.save
   song
end

def self.all
  @@all
end
def save
  @@all << self
end
def self.destroy_all
  @@all.clear
end


end
