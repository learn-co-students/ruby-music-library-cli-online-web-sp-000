class Artist
  extend Concerns::Findable
  
  @@all = []
  attr_accessor :name, :songs
  
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
    new(name).tap{ |g| g.save }
  end
  
  def add_song(song)
    song.artist = self if song.artist.nil?
    songs << song if !songs.include?(song)
  end
  
  def genres
    self.songs.collect { |song| song.genre }.uniq
  end
  
end