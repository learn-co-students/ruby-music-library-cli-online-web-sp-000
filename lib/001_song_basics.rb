
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
  name = song_file.split(" - ")[1]
  artist = song_file.split(" - ")[0]
  genre = song_file.split(" - ")[2]
  find_or_create_by_name(artist)
  find_or_create_by_name(name)
# binding.pry
end

# def create_from_filename(song_file)
#   if
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
