require 'pry'
class Song 
attr_accessor :name,:artist, :genre
@@all = []
def initialize(name, artist = nil, genre = nil)
  @name = name 
  self.artist = artist if artist
  self.genre = genre if genre 
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
  
def self.create(name, artist = nil, genre = nil)
  song = self.new(name, artist, genre)
  song.save
  song
end 
  
def self.find_by_name(name)
  self.all.find {|s| s.name == name}
end 
  
def self.find_or_create_by_name(name)
  self.find_by_name(name) || self.create(name)
end 
  
def artist=(artist)
  @artist = artist
  artist.add_song(self)
end
  
def genre=(genre)
  @genre = genre
  genre.songs << self unless genre.songs.include?(self)
end 
  
def self.new_from_filename(file)
  split_file = file.split(" - ")
  artist = Artist.find_or_create_by_name(split_file[0])
  genre = Genre.find_or_create_by_name(split_file[2].chomp(".mp3"))
  song = self.new(split_file[1], artist, genre)
  song
end 
  
def self.create_from_filename(file)
  song = self.new_from_filename(file)
  song.save
end 
end 