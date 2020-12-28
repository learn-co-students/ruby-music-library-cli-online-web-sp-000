class Genre 
  
  extend Concerns::Memorable::ClassMethods
  extend Concerns::Findable
  include Concerns::Memorable::InstanceMethods
  
  attr_accessor :name, :songs
  
  @@all = []
  
  def initialize(name)
    
    super(name)
    @songs = []
    
  end
  
  def self.all
    
    @@all
    
  end
  
  def self.create(name)
      
    new_genre = self.new(name)
    new_genre.save
    new_genre
    
      
  end
  
  def artists 
    
    songs.collect{|song| song.artist}.uniq
    
  end
  
end