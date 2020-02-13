class Genre  
  
  attr_accessor :name 
  
  @@all = []
  
  def initialize(name)
    @name = name 
  end 
  
  def self.all 
    @@all 
  end 
  
  def self.destroy_all
    @@all = []
  end 
  
  def self.create(name)
    genre = self.new(name)
    genre.save 
    genre 
  end 
  
  def save 
    @@all << self 
  end 
  
end 