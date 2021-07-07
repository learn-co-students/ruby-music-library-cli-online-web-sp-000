class Artist 
  attr_accessor :name, :song, :genres
  
  extend Concerns::Findable
  
  @@all = []
  def initialize(name)
    @name = name
    @songs = []
    save
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
    self.new(name) 
   
  end
  
  def songs
    @songs 
  end 
  
  def add_song(song)
    if song.artist == nil 
      song.artist = self 
    end 
    if !@songs.include?(song) 
      @songs << song 
    end
    
    def genres 
      songs.collect(&:genre).uniq 
    end 
    
      
   
    
  end
    
end