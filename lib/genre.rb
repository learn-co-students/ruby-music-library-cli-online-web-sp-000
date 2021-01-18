require_relative "./concerns/findable.rb"
class Genre 
  extend Concerns::Findable
  attr_accessor :name, :song, :musiclibrarycontroller
  
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
  end 
  
  def save 
    @@all << self 
  end 
  
  def self.create(name)
    genre = Genre.new(name)
    genre.save 
    genre 
  end 
  
  def self.all 
    @@all 
  end 
  
  def self.destroy_all 
    @@all.clear 
  end 
  
  def songs 
    @songs 
  end 
  
  def artists
    self.songs.map{|song| song.artist}.uniq
  end

end 