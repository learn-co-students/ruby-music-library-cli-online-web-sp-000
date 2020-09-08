require 'pry'

class Song
  attr_accessor :name, :artist, :genre

  @@all =[]

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist != nil
    self.genre = genre if genre != nil
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    if not genre.songs.include?(self)
      genre.songs << self
    end
  end

  def save
    @@all << self
  end

  def self.create(name)
    @@all << self.new(name)
    @@all.last
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.find_by_name(song)
    @@all.detect{|a| a.name == song}
  end

  def self.find_or_create_by_name(song)
    if self.find_by_name(song)
      self.find_by_name(song)
    else
      self.create(song)
    end
  end

  def self.new_from_filename(filename)
    file_artist = Artist.find_or_create_by_name(filename.split(" - ")[0])
    file_genre = Genre.find_or_create_by_name(filename.split(" - ")[2].split(".")[0])
    file_song = filename.split(" - ")[1]
    self.new(file_song, file_artist, file_genre)
    # binding.pry
  end

  def self.create_from_filename(filename)
    @@all << self.new_from_filename(filename)
  end


end
