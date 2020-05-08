require 'pry'

class Song 
  
  attr_accessor :name
  attr_reader :genre, :artist
  @@all = []
  
  
  def initialize(name, artist=nil, genre=nil)
    @name = name
    if artist != nil 
      self.artist = artist
    end
    if genre != nil 
      self.genre = genre
    end
  end
  
  def self.all 
    @@all
  end
  
  def save
    @@all << self 
  end
  
  def self.destroy_all 
    self.all.clear
  end
  
  def self.create(name)
    new_song = self.new(name)
    new_song.save
    new_song
  end
  
  def artist=(artist)
    @artist = artist 
    artist.add_song(self)
  end
  
  def genre=(genre)
    @genre = genre 
    genre.add_song(self)
  end
  
  def self.find_by_name(name)
    self.all.find {|song| song.name == name}
  end
  
  def self.find_or_create_by_name(name)
    if find_by_name(name)
      find_by_name(name)
    else 
      self.create(name)
    end
  end
  
  def self.new_from_filename(file)
    array = file.split(/( - )/)
    song = array[2].strip
    artist = array[0].strip
    genre_split = array[4].split(/[.]/)
    genre = genre_split[0]
    new_artist = Artist.find_or_create_by_name(artist)
    new_genre = Genre.find_or_create_by_name(genre)
    new_song = Song.new(song, new_artist, new_genre)
    new_song
  end
  
  def self.create_from_filename(file)
    new_song = new_from_filename(file)
    new_song.save
  end
  
  
  
end