class Artist
  extend Concerns::Findable
  attr_accessor :name, :songs
  attr_reader :genres
  @@all = []
  
  def initialize(name)
    @name = name 
    @songs = [ ]
  end
  
  def self.all 
    @@all 
  end
  
  def save 
    @@all << self 
  end 
  
  def self.destroy_all 
    @@all.clear
  end 
  
  def self.create(name)
    a = Artist.new(name) 
    a.save 
    a
  end
  
  def add_song(song)
    song.artist = self unless song.artist == self
    @songs << song unless self.songs.include?(song)
  end
  
  def genres
    self.songs.collect{|x| x.genre}.uniq
  end
  
  
end