class Artist 
  
  attr_accessor :name , :songs
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
  
  def add_song(song)
    unless @songs.include? (song)
    @songs << song
    end
    if song.artist == nil 
    song.artist = self
    end
   
  end
  
  def genres
   @genres = self.songs.map {|s| s.genre}.uniq
   @genres
  end
  

  
end