class Genre
  
  extend Concerns::Findable
  
  attr_accessor :name 
  
  @@all = [] 
  
  def initialize(name)
    @songs = []
    @name = name 
    save 
  end 
  
  def songs
    @songs
  end
  
  def self.all 
    @@all 
  end 
  
  def save
    @@all << self 
  end 
  
  def self.destroy_all 
    @@all.clear
  end 
  
  def self.create(name)
    genre = Genre.new(name)
  end
  
  def artists 
    final = []
    @songs.each do |song|
      if !final.include?(song.artist)
        final << song.artist
      end 
    end 
    final
  end 
    
    
  
end 
