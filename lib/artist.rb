class Artist 
  extend Concerns::Findable
  
  attr_accessor :name 
  attr_reader :songs
  
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
  end 
  
  def save 
    @@all << self 
  end 
  
  def self.create(new_artist)
    new_artist = self.new(new_artist)
    new_artist.save 
    new_artist
  end 
  
  def self.all
    @@all
  end 
  
  def self.destroy_all
    @@all.clear
  end 
  
  def add_song(new_song)
    new_song.artist = self unless new_song.artist == self 
    @songs << new_song unless self.songs.include?(new_song)
  end 
  
  def genres 
    # returns a collection of genres for all of the artist's songs
    self.songs.collect {|song| song.genre}.uniq 
  end 
  
end 