require 'pry'


class Song
  
  extend Concerns::Findable
  
  attr_accessor :name
  
  attr_reader :genre, :artist
  
  @@all = []
  
  def initialize(name, artist = nil, genre = nil)
    @name = name
    @artist = artist
    @genre = genre
    save
  end
  
  def save 
    @@all << self
  end
  
  def self.all
    @@all
  end
      
  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    new_object = self.new(name)
    new_object
  end
  
  
  def self.new_from_filename(file_name)
    artist_name = file_parser(file_name)[0].to_s
    song_name = file_parser(file_name)[1].to_s
    genre_name = file_parser(file_name)[2].to_s.delete(".mp3")
    song = Song.find_or_create_by_name(song_name)
    song.artist = Artist.find_or_create_by_name(artist_name)
    song.genre = Genre.find_or_create_by_name(genre_name)
    song
  end

  def self.create_from_filename(file_name)
    new_song = new_from_filename(file_name)
    new_song.save
    new_song
  end
  
  def artist=(artist)
    @artist = artist
    @artist.add_song(self)
    @artist
  end

  def genre=(genre)
    @genre = genre
    @genre.add_song(self)
    @genre
  end
  
  def self.file_parser(file_name)
    file_name.to_s.split(" - ")
  end
end