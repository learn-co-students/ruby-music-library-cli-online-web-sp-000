require 'pry'
class Song
  attr_accessor :name, :genre
  attr_reader :artist
 
  @@all = []
 
  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end
  
  def self.all
    @@all
  end
  
  def genre=(genre)
    @genre = genre
    genre.songs << self if !genre.songs.include?(self)
  end
  
  def artist=(artist)
    @artist = artist 
    artist.add_song(self)
  end

  def self.destroy_all
    @@all.clear
  end
 
  def save
    @@all << self
  end
  
  def self.create(name)
    song = self.new(name)
    song.save
    song
  end
  
  def self.find_by_name(name)
    @@all.find {|song| song.name == name}
  end
  
  def self.find_or_create_by_name(name)
    find_by_name(name) || create(name) 
  end
  
  def self.new_from_filename(name)
    a = name.split(" - ") 
    song_name = a[1]
    artist_name = a[0]
    genre_name = a[2].chomp(".mp3")
    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)
    new(song_name, artist, genre)
    #binding.pry
  end
  
  def self.create_from_filename(name)
    new_from_filename(name).save
  end
end