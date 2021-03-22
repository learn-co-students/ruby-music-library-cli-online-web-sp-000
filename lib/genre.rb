class Genre 
  extend Concerns::Findable
  attr_accessor :name, :song
  @@all = []
  def initialize(name, song = nil, artist = nil)
    @name = name
    @song = song
    @artist = artist
    @songs = []
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
  
  def self.create(name, song = nil, artist = nil)
    genre = self.new(name, song, genre)
    genre.save
    genre
  end 
  
  def songs 
    Song.all.select {|song| song.genre == self}
  end 
 
  def artists
    Song.all.map {|song| song.artist}.uniq
  end 
end 