class Artist
  extend Concerns::Findable
  
  attr_accessor :name 
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
    self.all.clear
  end
  
  def save 
    @@all << self 
  end
  
  def self.create(artist)
    artist = self.new(artist)
    artist.save
    artist
  end
  
  def songs
    @songs
  end
  
  def add_song(song)
    if (song.artist.nil?)
      song.artist = self
    end
    @songs << song unless @songs.include?(song)
  end
  
  def genres
    genres = songs.map do |song|
      song.genre 
    end 
    genres.uniq
  end
  
end