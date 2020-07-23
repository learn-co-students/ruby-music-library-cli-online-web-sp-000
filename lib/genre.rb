class Genre 
  
  extend Concerns::Findable
  attr_accessor :name, :songs
  
  def initialize(name)
    @name = name 
    @songs = []
  end 
  
  @@all = [] 
  
  def self.all 
    @@all
  end 
  
  def save
    Genre.all << self 
  end 
  
  def self.destroy_all
    @@all.clear 
  end 
  
  def genre 
    @genre
  end
  
  def self.create(name)
    new_song = Genre.new(name)
    new_song.save
    new_song
  end 
  
  def add_song(song)
    if song.genre == nil 
      song.genre = self
    end
    
    if !@songs.include?(song)
      @songs << song 
    end
    
  end
  
  def artists 
    artists = @songs.collect do |song|
      song.artist 
    end
    artists.uniq
  end
  
end