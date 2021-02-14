require "pry"

class Song 
  attr_accessor :name
  attr_reader :artist, :genre
  
  @@all = []
  
   def initialize(name, artist = nil, genre = nil)
    @name = name
     self.artist = artist if artist
     self.genre = genre if genre
     
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
    @@all = []
  end 
  
  def save
    @@all << self
  end 
  
  def self.create(song_name)
    song = Song.new(song_name) 
    song.save
    song
  end 
  
  def self.find_by_name(name)
  self.all.find {|song| name == song.name}
  end 
  
  def self.find_or_create_by_name(name)
    found_name = self.find_by_name(name)
      if found_name
        return found_name
    else
    self.create(name)
    end
  end
  
  def self.new_from_filename(filename)
     song = filename.split(" - ")[1]
     artist = filename.split(" - ")[0]
     genre = filename.split(" - ")[2].split(".mp3").join
    artist = Artist.find_or_create_by_name(artist)
    genre = Genre.find_or_create_by_name(genre)
     song = Song.new(song,artist,genre)
     
  end 
  
  def self.create_from_filename(filename)
    song = filename.split(" - ")[1]
    artist = filename.split(" - ")[0]
    genre = filename.split(" - ")[2].split(".mp3").join
    artist = Artist.find_or_create_by_name(artist)
    genre = Genre.find_or_create_by_name(genre)
     song = self.new_from_filename(filename)
     @@all << song
  end 
  
  
end