class Artist 
  
  extend Concerns::Findable
  attr_accessor :name, :songs
  
  def initialize(name)
    @name = name
    @songs = []
  end 
  
  @@all = [] 
  
  def self.all 
    @@all
  end 
  
  def save
    Artist.all << self 
  end 
  
  def self.destroy_all
    @@all.clear 
  end 
  
  def self.create(name)
    new_song = Artist.new(name)
    new_song.save
    new_song
  end 
  
  def add_song(song)
    if song.artist == nil 
      song.artist = self
    end
    
    if !@songs.include?(song)
      @songs << song 
    end
    
  end
  
  def genres 
    genres = @songs.collect do |song|
      song.genre 
    end
    genres.uniq
  end
  
  
  
end


  

  
  
