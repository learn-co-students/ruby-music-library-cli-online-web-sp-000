class Artist 
  extend Concerns::Findable
  attr_accessor :name, :song, :genre
  @@all = []
  def initialize(name, song = nil, genre = nil)
    @name = name
    @songs = []
  end 
  
  def self.all 
    @@all 
  end 
  
  def save
    @@all << self
  end 
  
  def self.destroy_all
    @@all.clear
  end 
  
  def self.create(name, song = nil, genre = nil)
    artist = self.new(name, song, genre)
    artist.save
    artist
  end 
  
  def songs 
    Song.all.select do |song|
      song.artist == self 
    end 
  end 
  
  def add_song(song)
    song.artist = self unless song.artist == self 
    @songs << song unless @songs.include?(song)
  end 
  
  def genres 
    Song.all.map {|song| song.genre}.uniq
  end 
end 