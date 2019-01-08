class Song 
  attr_accessor :name, :genre 
  @@all = []
  def initialize(name, artist = nil)
    @name = name
    if artist != nil 
      self.artist = artist
    end 
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
  
  def artist 
    @artist 
  end 
  
  def artist=(artist)
    @artist = artist 
    artist.add_song(self)
  end 
  
    
    
end