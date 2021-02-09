class Artist 
  
  attr_accessor :name, :songs
  extend Findable
  
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
    
  end
   def save 
    @@all << self 
  end 
  
  def self.destroy_all
    @@all.clear
  end 
  def self.all
    @@all 
  end 
  
 
  
    def self.create(artist)
    artist = self.new(artist)
    artist.save
    artist
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
  
  
  #def self.find_by_name(name)
  #  @@all.detect {|artist| artist.name == name}
  #end 
    
  
end 
  
  