require 'pry' 
class Song 
  
  attr_accessor :name, :artist  
  
  @@all = [] 
  
  def initialize(name, artist= "artist")
    @name = name 
    @artist = artist 
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
    @@all << Song.new(name).save 
  end 
  
end 