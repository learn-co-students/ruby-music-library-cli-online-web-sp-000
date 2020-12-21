class Genre
  attr_accessor :name,:songs
  
  extend Concerns::Findable
  
  @@all =[]
  
  def initialize(name)
    @name = name 
    @songs = []
    
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
    a = self.new(name)
    a.save
    a
  end 
  
  def add_song(song)
    if song.genre == nil
    song.genre = self
    self.songs << song
  
    else 
    if self.songs.include?(song)
      
    else
    self.songs << song
    end 
    end 
    
  end 
  
  
  def artists 
    gen = []
    self.songs.each do |song|
      gen << song.artist
    end 
    gen.uniq
    
  end 
  
  
  
  
  
  
end 