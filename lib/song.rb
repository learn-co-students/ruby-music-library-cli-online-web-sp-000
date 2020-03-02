require 'pry'
class Song
  extend Concerns::Findable
  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    if artist != nil
      self.artist = artist
    end
    if genre != nil
      self.genre = genre
    end
  end

  def artist
    @artist
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre
    @genre
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    self.class.all << self
  end

  def self.find_by_name(name)
    #finds a song instance in @@all by the name of the property of the song
    all.find{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    #returns an existing song with the provided name if one exists in @@all
    #creates song if an existing match is not found
    find_by_name(name) || create(name)
    #binding.pry
  end

  def self.create(name)
    song = new(name)
    song.save
    song
  end

  def self.new_from_filename(filename)
    parts = filename.split(" - ")
    artist = parts[0]
    song = parts[1]
    genre = parts[2]
    genre.slice! ".mp3"
    artist_name = Artist.find_or_create_by_name(artist)
    #binding.pry
    genre_name = Genre.find_or_create_by_name(genre)
    self.new(song, artist_name, genre_name)
    #binding.pry
  end

  def self.create_from_filename(filename)
    new_from_filename(filename).save
  end

end
