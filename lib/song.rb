require './config/environment.rb'

class Song
  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist=(artist) unless artist == nil
    self.genre=(genre) unless genre == nil
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
    all.clear
  end

  def save
    self.class.all << self
  end

  def self.create(name)
    Song.new(name).save
    all.last
  end

  def self.find_by_name(name)
    all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    found = self.find_by_name(name)
    if found
      found
    else
      self.create(name)
    end
  end

  def self.new_from_filename(file_name)
    artist = nil
    genre = nil
    data = /(?<artist>.+)\s-\s(?<title>.+)\s-\s(?<genre>.+)\.mp3/.match(file_name)
    artist = Artist.find_or_create_by_name(data[:artist])
    genre = Genre.find_or_create_by_name(data[:genre])
    Song.new(data[:title], artist, genre)
  end

  def self.create_from_filename(file_name)
    song = self.new_from_filename(file_name)
    song.save
    song
  end

end
