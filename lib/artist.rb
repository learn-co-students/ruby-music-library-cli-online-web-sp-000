class Artist 
  
  attr_accessor :name, :songs
  
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
  end
  
  def songs
    @songs
  end
  
  def genres 
    self.songs.collect {|song| song.genre}.uniq
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
    song = self.new(name)
    song.save
    song
  end
  
  def add_song(song)
    if song.artist || @songs.include?(song)
      return song
    else 
      song.artist=self
      @songs << song
    end
  end
    
  
end