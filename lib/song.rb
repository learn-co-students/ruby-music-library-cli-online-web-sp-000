require 'pry'

class Song

  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.destroy_all
    self.all.clear
  end

  def self.create(name)
    song = self.new(name)
    song.save
    song
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    self.genre.songs << self unless self.genre.songs.include?(self)
    #genre.add_song(self)
  end

  def genre
    @genre
  end

  def self.find_by_name(name)
    self.all.find{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if song = self.find_by_name(name)
      song
    else
      self.create(name)
    end
  end

  def self.new_from_filename(filename)
    song = self.new(filename.split(" - ")[1])
    my_artist = Artist.find_or_create_by_name(filename.split(" - ")[0])
    my_artist.add_song(song)
    my_genre = Genre.find_or_create_by_name((filename.split(" - ")[2]).split(".")[0])
    song.genre = my_genre
    song
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
  end

end
