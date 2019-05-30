class Song
extend Concerns::Findable
attr_accessor :name, :artist, :genre

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

def self.create(name, artist=nil, genre=nil)
  new_song = self.new(name, artist, genre)
  @@all << new_song
  @@all.last

end

def self.destroy_all
  @@all.clear
end

def artist=(artist)
@artist = artist
artist.add_song(self)
end

def genre=(genre)
@genre = genre
genre.songs << self unless genre.songs.include?(self)
end

def self.new_from_filename(filenames)
title = filenames.split(" - ")
artist = Artist.find_or_create_by_name(title[0])
genre = Genre.find_or_create_by_name(title[2].split(".")[0])
song = Song.new(title[1], artist, genre)
end

def self.create_from_filename(filenames)
  @@all << self.new_from_filename(filenames)
end

end
