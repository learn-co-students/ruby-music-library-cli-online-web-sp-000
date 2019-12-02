require_relative '../lib/concerns'

class Song

  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist = artist if artist != nil
    self.genre = genre if genre != nil
  end

  def self.all
    @@all
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

  def artist=(artist)
    @artist = artist
    self.artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    self.genre.add_song(self)
  end

  def self.find_by_name(name)
    self.all.detect{|song|song.name == name}
  end

  def self.find_or_create_by_name(name)
    song = self.find_by_name(name)
    if song == nil
      self.create(name)
    else
      song
    end
  end

  def self.new_from_filename(file_name)
    file_bits = file_name.gsub(/(\.mp3)/,'')
    file_bits = file_bits.split(" - ")
    artist = Artist.find_or_create_by_name(file_bits[0])
    genre = Genre.find_or_create_by_name(file_bits[2])
    song = Song.find_or_create_by_name(file_bits[1])
    song.genre = genre
    song.artist = artist
    song
  end

  def self.create_from_filename(filename)
    file = Song.new_from_filename(filename)
    file.save
    file
  end

end
