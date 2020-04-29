class Artist
  
  @@all = []
  extend Concerns::Findable
  attr_accessor :name, :songs
  
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
  
  def songs
    @songs
  end
  
  def genres
    self.songs.collect {|s| s.genre}.uniq
  end
  
  def add_song(song)
    song.artist = self unless song.artist == self
    @songs << song unless @songs.include?(song)
  end
  
  def self.destroy_all
    self.all.clear
  end
  
  def self.create(name)
    artist = self.new(name)
    artist.save
    artist
  end
  
end