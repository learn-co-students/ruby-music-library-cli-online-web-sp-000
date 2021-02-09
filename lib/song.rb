class Song 
  
  extend Findable
  attr_accessor :name, :songs, :artist
  
  @@all = []
  
  def initialize(name, artist=nil)
    @name = name
    @artist = artist
    @@all << self
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
  
  def self.create(song)
    song = self.new(song)
    song.save
    song
  end
  
   def add_song(song)
    if song.artist == nil
      song.artist = self
    else
      nil
    end
  end
  
  
  #def find_by_name(name)
  #  self.all.detect {|song| song.name == name}
  #end 
  
  
  
end 