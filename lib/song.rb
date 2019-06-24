require 'pry'

class Song 
  
  extend Concerns::Findable
  
  attr_accessor :name, :artist, :genre

  
  @@all = []
  
  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist =(artist) unless artist == nil
    self.genre = (genre) unless genre == nil
    save
  end
  
  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end
  
  def artist 
    @artist
  end
  
  def artist= (artist)
    @artist = artist
    artist.add_song(self)
  end 
  
  @@all = []
  
  def self.all
    @@all
  end
  
  def self.destroy_all
    @@all.clear
  end
  
  def save
    @@all << self
  end
  
  def self.create(song, artist=nil, genre=nil)
    new_song = Song.new(song, artist, genre)
  end
  
  ##def self.find_by_name(name)
   ## @@all.find{ |song| song.name == name}
  ##end
    
  ##def self.find_or_create_by_name(name)
   ## self.find_by_name(name) || self.create(name)
  ##end
  
  def self.new_from_filename(filename)
	  song_parts = filename.split(" - ")
	  song_name = song_parts[1]
	  artist = Artist.find_or_create_by_name(song_parts[0])
	  genre = Genre.find_or_create_by_name(song_parts[2].split(".")[0])
	  self.create(song_name, artist, genre)
  end
  
  def self.create_from_filename(filename)
    self.new_from_filename(filename)
  end
end