class Genre 
  extend Concerns::Findable
  attr_accessor :name, :songs, :artists
  @@all = []
  def initialize(name)
    @name = name
    @songs = []
  end
  
  def add_song(song)
    song.genre = self if song.genre == nil
    self.songs << song if !self.songs.include?(song)
    song
  end
  
  def self.create(name)
    self.new(name).save
  end
  
  def artists 
    self.songs.collect {|song| song.artist}.uniq
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