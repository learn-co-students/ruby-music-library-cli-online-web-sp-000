require 'pry'
class Song
  extend Concerns::Findable
  
  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist unless !artist
    self.genre = genre unless !genre
  end
  
  def self.all
    @@all
  end
  
  def save
    @@all << self
    self
  end
  
  def self.destroy_all
    self.all.clear
  end
  
  def self.create(name)
    @song = self.new(name)
    @song.name = name
    @song.save
    @song
  end
  
  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end
  
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end
  
  def self.find_by_name(name)
    @@all.detect{|a| a.name == name}
  end
  
  def self.new_from_filename(filename)
    filename_array = filename.split(" - ")
    new_song = self.new(filename_array[1])
    new_song.artist= Artist.find_or_create_by_name(filename_array[0])
    new_song.genre = Genre.find_or_create_by_name(filename_array[2].gsub(".mp3",""))
    new_song
  end
  
  #notes: new_song.genre=(genre) <-- before refactor and setting my variable to the object
  #new_song.artist=(artist) <--setting the string to an object variable before refactor now see line 54
  
  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end
  
  #difference betwn create and new is .save 
  def self.create_from_filename(filename)
    self.new_from_filename(filename).save 
  end
end