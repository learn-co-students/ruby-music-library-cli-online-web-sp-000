require 'pry'

class Song 
  attr_accessor :name
  attr_reader :artist, :genre 
  @@all = []
  
  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist 
    self.genre = genre if genre 
    save
  end
  
    def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end 
  
  def genre=(genre)
    @genre = genre 
  end 
  
  def save 
    @@all << self 
  end 
  
  def self.create(name)
    Song.new(name)
  end 
  
  def self.all 
    @@all
  end
  
  def self.destroy_all
    @@all.clear
  end
  
  def self.find_by_name(name)
    @@all.find {|song| song.name == name}
  end

  
  def self.find_or_create_by_name(name)
    self.find_by_name(name) ? self.find_by_name(name) : self.create(name)
  end
  
  def self.new_from_filename(filename)
    name = filename.split(" - ")[1]
    artist = filename.split(" - ")[0]
    genre = filename.split(" - ")[2].gsub(".mp3", "")
    artist_name = Artist.find_or_create_by_name(artist)
    genre_name = Genre.find_or_create_by_name(genre)
    new(name, artist_name, genre_name)
  end
  
  def self.create_from_filename(filename)
    self.new_from_filename(filename)
  end 
    
end 