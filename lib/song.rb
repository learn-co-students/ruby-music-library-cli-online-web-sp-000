require 'pry'
class Song

  attr_accessor :name, :artist
  attr_reader :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    if artist
      self.artist = artist
    end
    if genre
      self.genre = genre
    end
    @@all << self
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

  def self.create(song)
    new_song = self.new(song)
    new_song
  end

  def artist=(artist_name)
    @artist = artist_name
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
    end

  def self.find_by_name(song_name)
    self.all.find{|songs| songs.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    if song = self.find_by_name(song_name)
    song
    else
      self.create(song_name)
    end
  end

  def self.new_from_filename(filename)
    song_name = filename.split(" - ")[1]
    artist_name = filename.split(" - ")[0]
    genre = filename.split( " - ")[2].gsub(".mp3", "")
    artist_name = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre)

    self.new(song_name, artist_name, genre)
  end

  def self.create_from_filename(filename)
    new_from_filename(filename).tap{ |a| a.save}
  end
end
