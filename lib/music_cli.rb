require 'pry'

class Song
  attr_accessor :name, :artist
  @@all = []

  def initialize(name, artist = nil)
    @name = name
    @artist = artist
  end
  
  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  
  def self.create(name, artist = nil)
    song = self.new(name, artist)
    song.save
    song
  end
  
  def self.destroy_all
    self.all.clear
  end
end

class Artist
  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end
  
  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  
  def self.create(name)
    artist = self.new(name)
    artist.save
    artist
  end
  
  def add_song(song)
    if song.artist == nil
      song.artist = self
      self.songs << song
    end
  end
  
  def self.destroy_all
    self.all.clear
  end
end

class Genre
  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name
  end
  
  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  
  def self.create(name)
    genre = self.new(name)
    genre.save
    genre
  end
  
  def self.destroy_all
    self.all.clear
  end
end

#binding.pry