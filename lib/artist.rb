class Artist 
  attr_accessor :name, :song
  extend Concerns::Findable
  
  @@all = []
  
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
    artist = Artist.new(name)
    artist.save
    artist
  end
  
  def songs
    @songs
  end
  
  def add_song(song)
    
    if song.artist == nil
      song.artist = self
    else
      nil
    end
    
    if @songs.include?(song)
      nil 
    else
      @songs << song 
    end
    
    song 
    
  end
  
  def genres 
    @genres_arr = []
    
    @songs.each do |song|
      if @genres_arr.include?(song.genre)
        nil
      else
        @genres_arr << song.genre
      end
      
    end
    @genres_arr
  end
  
  
end