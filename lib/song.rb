require 'pry'

class Song

  attr_accessor :name, :artist, :genre

  @@all = []

#---how to differentiate between 2nd and third optional arguments?
  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    #invoke optional third argument (Genre object) and assign to the Song's genre property
    #---why is self.genre nil in pry? is there no genre passed in during test?
    self.genre = genre if genre
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    song = Song.new(name)
    song.save
    song
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre) #Genre object
    #unless the song already has a Genre object
    unless self.genre
    #assign the Song's genre property to the Genre object
      #self.genre = genre #---MAIN ERROR
    end

    unless genre.songs.include?(self)
      genre.songs << self
    end

#binding.pry

  end

end
