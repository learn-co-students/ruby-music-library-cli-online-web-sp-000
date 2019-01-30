require 'pry'

class Song 
  attr_accessor :name, :artist
  attr_reader :genre 
  
  @@all = [] 
  
  def initialize(name, artist = nil, genre = nil)
    @name = name 
    @artist = artist 
    self.genre=(genre) unless genre == nil 
  end 
  
  def genre=(genre)
    @genre = genre 
    genre.songs << self unless genre.songs.include?(self)
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
    song = self.new(name)
    song.save
    song 
  end
  
  def self.new_from_filename(name)
      words = name.split(" - ")
      words[2].slice!(".mp3")
      
        
      genre = Genre.find_or_create_by_name(words[2].strip)
      artist = Artist.find_or_create_by_name(words[0].strip)
      
      song = self.new(words[1].strip,artist,genre)
    
    
    end
    
  def self.create_from_filename(name)
      song = self.new_from_filename(name)
      song.save 
    end
    
  

end 