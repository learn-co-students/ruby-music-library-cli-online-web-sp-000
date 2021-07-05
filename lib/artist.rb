require_relative "../lib/findable_module.rb"
class Artist
extend Concerns::Findable 
include Concerns::Findable 
attr_accessor :name 

@@all = []

def initialize(name)
  @name =  name
  @songs = []
end

def Artist.create(name)
  new_artist = Artist.new(name)
  new_artist.save
  new_artist
end

def songs 
  @songs
end
def save
  @@all << self
end

def add_song(song)
  if self.songs.include?(song) == false 
    songs << song
    if song.artist != self 
    song.artist = self
  end 
  end
  end


def genres
  genre_list = []
  self.songs.each do |song|
    if genre_list.include?(song.genre) == false
      genre_list << song.genre 
    end
  end
    genre_list
end

def add_genre(genre)
  if self.genres.include?(genre) == false 
    genres << genre
    if genre.artists.include?(self) == false 
    genre.add_artist(self)
  end 
  end
  end

def self.destroy_all
  @@all.clear
end

def self.all
  @@all
end
end