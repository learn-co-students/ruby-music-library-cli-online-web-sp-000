require 'pry'

class Song
attr_accessor :name
attr_reader :artist, :genre

@@all = []

def initialize(name, artist = nil, genre = nil)
  @name = name
  self.artist=(artist) if artist != nil
  self.genre=(genre) if genre != nil
end

def self.all
  @@all
end

def self.destroy_all
   @@all.clear
end

def save
  @@all << self
end

def self.create(name)
  song = self.new(name)
  song.save
  song
end

def artist=(artist)
  @artist = artist
  self.artist.add_song(self)
end

def genre=(genre)
  @genre = genre
  self.genre.add_song(self)
end

def self.find_by_name(name)
  self.all.detect { |song| song.name == name }
end

def self.find_or_create_by_name(name)
   self.find_by_name(name) || self.create(name)
end

def self.new_from_filename(filename)
  file = filename.gsub(/.mp3/, '')
  song_info = file.split(" - ")
  song_name = song_info[1]
  song_artist = Artist.find_or_create_by_name(song_info[0])
  song_genre = Genre.find_or_create_by_name(song_info[2])
  song = self.new(song_name, song_artist, song_genre)
end

def self.create_from_filename(filename)
  song = self.new_from_filename(filename)
  song.save
  song
end

end
