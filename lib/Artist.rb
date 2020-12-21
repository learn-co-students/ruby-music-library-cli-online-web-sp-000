class Artist
  attr_accessor :name, :songs, :genres 
  
  extend Concerns::Findable
  
  @@all =[]
 
  
  def initialize(name)
    @name = name 
    @songs = []
  end 
  
  def self.all 
    @@all
  end 
  
  def self.destroy_all
    @@all.clear
  end 
  
  def save 
    @@all << self
  end 
  
  def self.create(name)
    a = self.new(name)
    a.save
    a
  end 
  
def add_song(song)
    if song.artist == nil
      song.artist = self
    else
      nil
    end
    if @songs.include?(song)
      nil
    else
      @songs << song
    end
    song
  end
  
  
  
  def genres 
    gen = []
    self.songs.each do |song|
      gen << song.genre
    end 
    gen.uniq
  end 
  
  
  
  
  
end 
