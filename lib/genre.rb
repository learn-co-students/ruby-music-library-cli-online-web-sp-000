class Genre  
  
  attr_accessor :name, :songs
  @@all = []
    extend Concerns::Findable
  
  def initialize(name)
    @name = name 
    @songs = []
  end
  
  def save 
    @@all << self 
  end
  
  def self.all 
    @@all 
  end
  
  def self.destroy_all 
    @@all = []
  end
  
  def self.create(name)
    new = self.new(name)
    new.save
    new
  end  
  
  def songs 
    @songs 
  end
  
  def artists 
    @artists = self.songs.map {|s| s.artist}.uniq
    @artists
  end  

  
  
end