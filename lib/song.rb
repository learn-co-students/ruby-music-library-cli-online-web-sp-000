require 'pry'

class Song
  
  extend Concerns::Findable

  attr_accessor :name, :genre
  attr_reader :artist
 
  @@all = []
 
  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist=(artist) unless artist==nil
    self.genre=(genre) unless genre==nil
  end
    
  def save
      self.class.all << self
  end
    
  def self.all
    @@all
  end
  
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end
  
  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end
  
  def self.new_from_filename(filename)
    #instantiates a new song object based on a provided filename
    filename = filename.delete_suffix(".mp3")
    artist_name, song_name, genre_name = filename.split(" - ")
   
    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)
    self.new(song_name, artist, genre)
    
  end
  
  def self.create_from_filename(filename)
    #does same thing but also saves newly created song to @@all
    self.new_from_filename(filename).save
  end
  
end