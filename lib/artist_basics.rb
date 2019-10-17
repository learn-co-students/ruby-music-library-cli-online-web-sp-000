class Artist
  
  attr_accessor :name
  
  @@all = []
  
  def initialize(name)
    @name = name
    save
  end
  
  def self.all
    @@all
  end
  
  def save 
    @@all << self
  end
  
  def destroy_all
    @@all.clear
  end
  
  def create(song)
    self.new
    save
  end
end