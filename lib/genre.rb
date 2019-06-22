class Genre 
  
  extend Concerns::Findable
  
  attr_accessor :name
  
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
    save
  end
  
  def songs
    @songs
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
     new_genre = Genre.new(name)
  end
    
  def add_song(song)
    self.songs << song unless @songs.include?(song)
    self.artist << song.artist unless @songs.include?(song)
    song.genre = self if song.genre.nil?
  end  
  
  def artists
   @songs.collect {|song| song.artist}.uniq
  end
  
end