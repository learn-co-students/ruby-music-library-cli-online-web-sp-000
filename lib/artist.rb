class Artist 
  extend Concerns::Findable
  attr_accessor :name, :songs
  @@all = []
  def initialize(name)
    @name = name
    @songs = []
  end
  
  def add_song(song)
    song.artist = self if song.artist == nil
    self.songs << song if !self.songs.include?(song)
    song
  end
  
  def self.create(name)
    self.new(name).save
  end
  
  def genres 
    self.songs.collect {|song| song.genre}.uniq
  end
  
  def save
    self.class.all << self
    self
  end
  
  def self.destroy_all
    self.all.clear
  end
  
  def self.all
    @@all
  end
end