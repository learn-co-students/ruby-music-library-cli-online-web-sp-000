require 'pry'

class Song
  extend Concerns::Findable

attr_accessor :name, :artist, :genre, :musiclibrarycontroller


  @@all=[]

def initialize(name, artist=nil, genre=nil)
  @name=name
  self.artist=artist if artist
  self.genre=genre if genre
end

def self.all
  @@all
end

def self.destroy_all
  self.all.clear
end

def save
  self.class.all << self
end

def self.create(name)
  song=self.new(name)
  song.save
  song
end

def artist=(artist)
  @artist=artist
  artist.add_song(self)
end

def genre=(genre)
  @genre=genre
  genre.songs<<self
  genre.songs.uniq!
end

def self.find_by_name(name)
  @@all.find{|song| song.name==name}
end

def self.find_or_create_by_name(name)
  self.find_by_name(name) || self.create(name)
end

def self.new_from_filename(filename)
  music=filename.split(" - ")

  name=music[1]
  artist=music[0]
  genre=music[2].split(".mp3").join

  artist=Artist.find_or_create_by_name(artist)
  genre=Genre.find_or_create_by_name(genre)
  self.new(name, artist, genre)
end

def self.create_from_filename(filename)
  self.new_from_filename(filename).save
end


end
