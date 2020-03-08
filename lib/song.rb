require 'pry'
class Song
  attr_accessor :name, :genre, :artist
  
  @@all = []
  
  def initialize(name, artist = nil, genre = nil)
    @name = name
    artist.add_song(self) if !(artist == nil)
    self.genre = genre if !(genre == nil)
  end
  
  def self.all
    @@all
  end
  
  def save
    @@all << self
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
  
  def genre=(genre)
    @genre = genre
    if !(@genre.songs.include?(self))
      @genre.songs << self
    end
  end
  
  def self.find_by_name(name)
    self.all.find {|song| song.name == name}
  end
  
  def self.find_or_create_by_name(name)
    selected_song = nil
    selected_song = self.find_by_name(name)
    if selected_song == nil
      selected_song = self.create(name)
    end
    selected_song
  end
  
  def self.new_from_filename(file)
    song_name = file.split(" - ")[1]
    song_artist = file.split(" - ")[0]
    song_genre = file.split(" - ")[2].split(".")[0]
    song_artist = Artist.find_or_create_by_name(song_artist)
    song_genre = Genre.find_or_create_by_name(song_genre)
    Song.new(song_name, song_artist, song_genre)
  end
  
  def self.create_from_filename(file)
    song = Song.new_from_filename(file)
    song.save
  end
end