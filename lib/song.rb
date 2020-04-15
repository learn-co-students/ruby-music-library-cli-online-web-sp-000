require 'pry'

class Song
  
  @@all = []
  
  attr_accessor :name
  attr_reader :artist, :genre
  
  def initialize(name, artist = nil, genre = nil)
    @name = name
    if artist != nil
      self.artist = artist
    end
    if genre != nil
      self.genre = genre
    end
    @@all << self
  end
  
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
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

  def self.create(name)
    song = new(name)
    song.save
    song
  end
  
  def self.find_by_name(name)
    self.all.find {|song| song.name == name}
  end
  
  def self.find_or_create_by_name(name)
<<<<<<< HEAD
=======
    # binding.pry
>>>>>>> 77280342c384c66b8e9350bb446d56ba2168a401
    find_by_name(name) || create(name)
  end
  
end