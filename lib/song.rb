require 'pry'
require_relative '../lib/concerns/findable.rb'


class Song 
extend Concerns::Findable
  attr_accessor :name
  attr_reader :artist, :genre 
  
   
  
  @@all = []
 
  def initialize(name, artist = nil, genre = nil)
    @name = name 
    if artist != nil 
      self.artist = artist 
    end 
    if genre != nil
      self.genre = genre 
    end   
    #save 
  end 
  
  def self.all 
    @@all 
  end 
  
  def self.destroy_all
    all.clear
  end 
  
  def save
    self.class.all << self
  end 
  
  def self.create(name, artist=nil, genre=nil) 
   song = new(name)  
   song.save 
   song
  end 
  
  def artist=(artist)
   @artist = artist
   artist.add_song(self)
  end 
 
  def genre=(genre)
   @genre = genre 
   genre.songs << self unless genre.songs.include?(self)
  end 
  
  

  def self.new_from_filename(filename)
    parts = (filename.gsub(".mp3","").split(" - "))
    song = self.new(parts[1])
    song.artist = Artist.find_or_create_by_name(parts[0])
    song.genre = Genre.find_or_create_by_name(parts[2])
    song.save
    song
  end
   
  
  def self.create_from_filename(filename)
     
    new_from_filename(filename).save

     
  end 
  
end 

#created_song = Song.create("Kaohsiung Christmas")