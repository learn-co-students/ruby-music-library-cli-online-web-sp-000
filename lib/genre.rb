require_relative '../lib/concerns/findable.rb'
 
class Genre 
  extend Concerns::Findable
  attr_accessor :name 
  
  @@all = []	
 
  def initialize(name)
    @name = name 
    @songs = []
    save
  end 
  
  def self.all 
    @@all 
  end 
  
  def self.destroy_all
    @@all = []
  end 
  
  def save
    @@all << self 
  end 
  
  def self.create(genre_name)
   self.new(genre_name)
  end 
  
  
  
  
  
  def songs 
    @songs 
  end 
  
  def artists
    @a_array = [] 
    
    self.songs.collect do |song| 
     @a_array << song.artist
    end   
      @a_array.uniq
  end 
  
  
end 
