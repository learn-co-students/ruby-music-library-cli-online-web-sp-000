require_relative "../lib/findable_module.rb"
class Genre


extend Concerns::Findable 
include Concerns::Findable 

attr_accessor :name, :songs

@@all = []

def initialize(name)
  @name =  name
  @songs = []
end

def Genre.create(name)
  new_Genre = Genre.new(name)
  new_Genre.save
  new_Genre
end

def save
  @@all << self
end

def add_song(song)
  if self.songs.include?(song) == false 
    self.songs << song
    if song.genre != self 
    song.genre = self
  end 
  end
  end
  
  def artists 
     artist_list = []
  self.songs.each do |song|
    if artist_list.include?(song.artist) == false
      artist_list << song.artist 
    end
  end
    artist_list
  end 
  
  def add_artist(artist)
  if self.artists.include?(artist) == false 
    self.artists << artist
    if artist.genre.include?(self) == false 
    artist.add_genre(self)
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
