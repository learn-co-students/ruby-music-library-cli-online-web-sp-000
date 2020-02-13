class Artist 
  
  attr_accessor :name, :songs 
  
  @@all = []
  
  def initialize(name)
    @name = name 
    @songs = []
  end 
  
  def self.all 
    @@all 
  end 
  
  def self.destroy_all
    @@all = []
  end 
  
  def self.create(name)
    artist = self.new(name)
    artist.save 
    artist 
  end 
  
  def save 
    @@all << self 
  end 
  
  def add_song(new_song)
    new_song.artist = self if new_song.artist == nil 
    @songs << new_song if @songs.none?{|song| song == new_song}
  end
  
end 