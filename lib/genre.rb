class Genre 
  
  extend Concerns::Findable
  
  attr_accessor :name 
  
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
  end
  
  def self.all 
    @@all 
  end
  
  def songs 
    @songs 
  end
  
  def add_song(song)
    @songs << song unless @songs.include?(song)
    song.genre = self unless song.genre == self 
  end
  
  def artists 
    self.songs.collect{|s| s.artist}.uniq
  end
  
  def save 
    @@all << self 
  end
  
  def self.destroy_all 
    self.all.clear 
  end
  
  def self.create(name)
    self.new(name).tap do |genre|
      genre.save 
    end
  end
  
end