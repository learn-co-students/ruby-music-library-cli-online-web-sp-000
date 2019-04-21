require 'pry'
class Song 
  extend Concerns::Findable

  attr_accessor :name
  
  @@all = []
  
  def initialize(name, artist = nil, genre = nil)
    @name = name 
    if artist != nil  
      self.artist=(artist)
    end 
    
    if genre != nil 
      self.genre=(genre)
    end 
    
    @@all << self 
  end 
  
  def artist=(name)
    @artist = name 
    name.add_song(self)
  end 
  
  def artist
    @artist 
  end 
  
  def genre=(genre)
    @genre = genre 
    if !genre.songs.include?(self) 
      genre.songs << self
    end 
  end 
  
  def genre 
    @genre  
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
    new_song = Song.new(name)
  end 

 # def self.find_by_name(name)
 #   found_song = @@all.select do |song| 
 #     song.name == name 
 #   end 
 #   found_song.first 
 # end 
  
#  def self.find_or_create_by_name(name)
#    found = self.find_by_name(name)
 #   if !found 
 #     self.create(name)
 #   else 
 #     found 
 #   end 
 # end 

  def self.new_from_filename(file)
    filename = file.split(" - ")
    artist = Artist.find_or_create_by_name(filename[0])
    genre = Genre.find_or_create_by_name(filename[2].chomp(".mp3"))
    name = filename[1]
    new_song = Song.new(name, artist, genre)
  end 
  
  def self.create_from_filename(file)
    self.new_from_filename(file)

  end 
  
end 
