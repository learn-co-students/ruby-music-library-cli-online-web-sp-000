require 'pry'
class Song
  extend Concerns::Findable
  attr_accessor :name

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name

    #check if artist is object
    self.artist=(artist) if artist != nil

    #check if genre is object
    if genre != nil
      self.genre = genre
    end

  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.create(name)
    created_song = Song.new(name)
    created_song.save
    created_song
  end

  def self.destroy_all
    @@all.clear
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
    genre.songs << self if !genre.songs.include?(self)
  end

  def self.new_from_filename(file)
    file_components = file.split(" - ")
    file_artist = file_components[0]
    file_song = file_components[1]
    file_genre = file_components[2].chomp(".mp3")

    new_song = self.find_or_create_by_name(file_song)
    new_artist = Artist.find_or_create_by_name(file_artist)
    new_genre = Genre.find_or_create_by_name(file_genre)

    new_song.artist = new_artist
    new_song.genre = new_genre
    new_song
  end

  def self.create_from_filename(file)
    new_song = self.new_from_filename(file)
    new_song.save
  end

end
