require 'pry'
class Song
  extend Concerns::Findable
  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist=(artist) if artist != nil
    self.genre=(genre) if genre != nil
  end

  def self.all
    @@all.uniq
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self unless @@all.include?(self)
  end

  def self.create(name, artist=nil, genre=nil)
    newsong = self.new(name)
    newsong.save
    newsong
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end

  def find_by_name(name)
    @@all.detect do |song|
      song.name == name
    end
  end

  def self.new_from_filename(name)
    artist, song, genre_filename = name.split(' - ')
    genre_no_filename = genre_filename.gsub('.mp3', '')
    artist = Artist.find_or_create_by_name(artist)
    genre = Genre.find_or_create_by_name(genre_no_filename)
    new(song, artist, genre)
  end

  def self.create_from_filename(name)
    self.new_from_filename(name).save
  end
end
