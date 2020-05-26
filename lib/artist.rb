class Artist
  
  extend Concerns::Findable
 
  attr_accessor :name
  attr_reader :songs
  
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
  end
    
  def songs
    @songs
  end
    
  def self.all
    @@all
  end
  
  def save
      self.class.all << self
  end

  def add_song(song)
    song.artist = self unless song.artist
    @songs << song unless @songs.include?(song)
  end
  
  def genres
    x = []
    @songs.each do |i|
      x << i.genre unless x.include?(i.genre)
    end
    x
  end
  

end