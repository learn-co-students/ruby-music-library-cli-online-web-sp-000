class Genre 
  
  extend Concerns::Findable
  
  attr_accessor :name, :artists 
  
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
  
  def save
    @@all << self
  end 
  
  def self.create(genre_name)
    genre = Genre.new(genre_name) 
    genre.save
    genre
  end 
  
  def songs
    @songs 
  end 
  
  def add_song(song)
   if song.genre
     song.genre
   else 
     song.genre = self
  end 
  if @songs.include?(song)
    song
  else
  @songs << song
end
end

def artists
  @songs.collect do |genre|
  genre.artist 
  end.uniq
end
  
  
end