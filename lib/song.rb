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
    # if genre.song != self
    #   genre.song = self
    # end
    # if !@songs.include?(song)
    #   @songs << song
    # end
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
  
  
end