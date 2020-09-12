class Artist < Base
  
  attr_accessor :name, :songs, :genres
  extend Concerns::Findable
  
  def initialize(name)
    @name = name
    @songs = []
    @@all << self
  end 
  
  def self.create(artist)
    new_artist = self.new(artist)
    new_artist.save
    new_artist
  end
  
  def songs
    @songs
  end
  
  def add_song(song)
    if @songs.include?(song)
      nil 
    else
      @songs << song
      song.artist != self ? song.artist = self : nil
    end
  end
  
  def genres
    @genres = []
    @songs.each {|song| @genres.include?(song.genre) ? nil : @genres << song.genre }
    @genres
  end
    
    
  
end 