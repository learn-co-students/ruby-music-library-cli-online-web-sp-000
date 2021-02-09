class Genre 

  extend Findable
  attr_accessor :name, :songs 
  
  @@all = []
  
  def initialize(name)
    @name = name 
  end 
  
  def self.all 
    @@all 
  end 
  
  def save 
    @@all << self 
  end 
  
   def self.create(genre)
    genre = self.new(genre)
    genre.save
    genre
  end
  
   # def self.find_by_name(name)
  #  @@all.detect {|artist| artist.name == name}
  #end 
    
    
 def self.destroy_all 
  @@all.clear
 end 
  
end 
  