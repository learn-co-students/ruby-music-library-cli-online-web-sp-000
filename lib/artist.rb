class Artist 
  
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
      
    new_artist = self.new(name)
    #binding.pry 
    new_artist.save
    #binding.pry 
    new_artist
    
  end
  
  def add_song(song)
    
    if(!song.artist)
      
      song.add_artist(self)
      @songs << song
      
    end
  end
  
  
  def genres 
    
    songs.collect{|song| song.genre}.uniq
    
  end
  
end