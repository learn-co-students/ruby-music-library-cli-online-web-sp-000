class Artist 
  
  extend Concerns::Findable 
  
  attr_accessor :name, :song
  attr_reader :genre 
  
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
    new_artist = Artist.new(name)
    new_artist.save 
    new_artist  
  end 
  
  def songs 
    @songs 
  end 
  
  def add_song(song)
    if !songs.include?(song)
        songs << song
    end 
    
    if song.artist == nil 
      song.artist = self
    end 
  end 
  
  def genres 
   new_array = self.songs.collect do |song|
     song.genre 
      end 
      new_array.uniq
  end 
  
end 