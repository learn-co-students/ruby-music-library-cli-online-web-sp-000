class Genre
  
  extend Concerns::Findable
  
  attr_accessor :name, :songs
  
 @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
  end
    
  def self.all
    @@all
  end
  
  def save
    @@all << self
  end
  
  def artists
    @songs.collect {|s| s.artist}.uniq
  end

  def add_song(song)
    song.genre = self unless song.genre
    @songs << song unless @songs.include?(song)
  end
  
end