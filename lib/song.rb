require 'pry'
class Song 
  attr_accessor :name
  attr_reader :artist, :genre
  @@all = []
  def initialize(name, artist = nil, genre = nil)
    self.name = name
    self.artist = artist if !(artist == nil)
    self.genre = genre if !(genre == nil)
  end
  
  def save
    self.class.all << self
    self
  end
  
  def artist=(artist)
    @artist = artist 
    artist.add_song(self)
  end
  
  def genre=(genre)
    @genre = genre 
    genre.add_song(self)
  end
  
  def self.new_from_filename(filename)
    song_data = filename.split(" - ")
    artist = Artist.find_or_create_by_name(song_data[0])
    name = song_data[1]
    genre = Genre.find_or_create_by_name(song_data[2].split(".").first)
    
    self.new(name, artist, genre)
  end
  
  def self.create_from_filename(filename)
    self.new_from_filename(filename).save
  end
  
  def self.find_or_create_by_name(name)
    self.find_by_name(name) ? self.find_by_name(name) : self.create(name)
  end
  
  def self.find_by_name(name)
    self.all.detect {|song| song.name == name}
  end
  
  def self.create(name, artist = nil, genre = nil)
    self.new(name, artist, genre).save
  end
  
  def self.destroy_all
    self.all.clear
  end
  
  def self.all
    @@all
  end
end

#binding.pry
