require_relative "./concerns/findable.rb"
class Artist 
  extend Concerns::Findable
  attr_accessor :name, :songs, :musiclibrarycontroller
  
  @@all = []
  
  def initialize(name)
    @name = name 
    @songs = []
  end
  
  def save 
    @@all << self
  end
  
  def self.create(name)
    artist = Artist.new(name)
    artist.save
    artist
  end 
  
  def self.all 
    @@all 
  end
  
  def self.destroy_all 
    @@all.clear 
  end
  
  def add_song(song) 
    if !song.artist && song.artist != ""
      song.artist = self
    end
    if !songs.include?(song)
      self.songs << song
    end
  end
  
  def genres
    self.songs.map {|song| song.genre}.uniq
  end 
  
end