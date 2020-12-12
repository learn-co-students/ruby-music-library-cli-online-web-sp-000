class Genre 
  extend Concerns::Findable
  
  attr_accessor :name 
  
  @@all = []
  
  def initialize(name)
    @name = name 
    @songs = []
  end 
  
  def songs 
    @songs
  end 
  
  def save 
    @@all << self 
  end 
  
  def self.create(new_genre)
    new_genre = self.new(new_genre)
    new_genre.save
    new_genre
  end 
  
  def self.all
    @@all 
  end 
  
  def self.destroy_all
    @@all.clear
  end 
  
  def artists 
    self.songs.collect {|song| song.artist}.uniq 
  end 
end 