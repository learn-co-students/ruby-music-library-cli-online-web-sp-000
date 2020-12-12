require 'pry'

class Song 
  attr_accessor :name
  attr_reader :artist, :genre
  
  @@all = []
  
  def initialize(name, artist = nil, genre = nil)
    @name = name
    if artist != nil 
      self.artist=(artist)
    end 
    if genre != nil 
      self.genre=(genre)
    end 
  end 
  
  def artist=(artist)
    @artist = artist 
    artist.add_song(self)
  end 
  
  def genre=(genre)
    @genre = genre 
    genre.songs << self unless genre.songs.include?(self)
  end 
  
  def save 
    @@all << self 
  end 
  
  def self.create(new_song)
    new_song = self.new(new_song)
    new_song.save
    new_song
  end 
  
  def self.all 
    @@all 
  end 
  
  def self.destroy_all 
    @@all.clear
  end 
  
  def self.find_by_name(song_name)
    @@all.detect {|song| song.name == song_name} 
  end 
  
  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.create(song_name)
  end 
  
  def self.new_from_filename(filename)
    artist_name, song_name, genre_name = filename.chomp(".mp3").split(" - ")
    artist_name = Artist.find_or_create_by_name(artist_name)
    genre_name = Genre.find_or_create_by_name(genre_name)
    self.new(song_name, artist_name, genre_name) 
  end 
  
  def self.create_from_filename(filename)
    self.new_from_filename(filename).save
  end 
  
end 