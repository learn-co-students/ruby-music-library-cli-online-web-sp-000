class Genre 
   
  attr_accessor :name
  attr_reader :songs, :artists
  
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
  end
  
  def artists 
    songs.map(&:artist).uniq
  end
  
  
   def self.all
     @@all
   end
   
   def self.destroy_all
     @@all.clear
   end
   
   def save
    self.class.all << self
   end
   
   def self.create(name)
     genre = new(name)
     genre.save
     genre
  end
end 