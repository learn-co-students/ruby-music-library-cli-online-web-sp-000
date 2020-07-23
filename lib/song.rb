require 'pry'

class Song
  extend Concerns::Findable
  
  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    self.name = name
    self.artist = artist unless artist.nil?
    self.genre = genre unless genre.nil?
  end

  def save
    @@all << self
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end

  def self.new_from_filename(file)
    song_info_array = file.delete_suffix(".mp3").split(" - ")
    song_artist = Artist.find_or_create_by_name(song_info_array[0])
    song_name = song_info_array[1]
    song_genre = Genre.find_or_create_by_name(song_info_array[2])
    song = self.create(song_name, song_artist, song_genre)
  end

  def self.create_from_filename(file)
    new_from_filename(file)
  end

  def self.create(name, artist = nil, genre = nil)
    song = self.new(name, artist, genre)
    song.save
    song
  end
  
  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end
end