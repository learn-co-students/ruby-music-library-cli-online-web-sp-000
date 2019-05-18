require 'pry' 
class Song 
  extend Concerns::Findable 
  
  attr_accessor :name   
  attr_reader :artist, :genre   
  
  @@all = [] 
  
  def initialize(name, artist= nil, genre= nil)
    @name = name 
    self.artist = artist if artist
    self.genre = genre if genre 
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
    new_song.save
    new_song
  end 
  
  def artist=(artist)
    #binding.pry 
   @artist = artist
   artist.add_song(self)
  end
          
  def genre=(genre)
   # binding.pry 
    @genre = genre 
      if !genre.songs.include?(self) 
        genre.songs << self 
      end 
  end         
  
  def self.new_from_filename(file_name)
    #binding.pry 
    new_file = file_name.split(" - ")
    song = new_file[1]
      new_song = song.join(" ")
      new_song
 end 
    
  
  
  
end 