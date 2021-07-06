class Song

  include
  extend Concerns::Findable

  attr_accessor :name
  attr_reader :artist, :genre
  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name
    if !artist.nil?
      self.artist = artist
    end
    if !genre.nil?
      self.genre = genre
    end
  end

  def save
    self.class.all << self
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    if !genre.songs.include?(self)
      genre.songs << self
    end
  end

  def self.create(name)
    song = self.new(name)
    song.save
    song
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def self.new_from_filename(file_name)
    file_name_splits = file_name.split(" - ")
    artist_name = file_name_splits[0]
    song_name = file_name_splits[1]
    genre_name = file_name_splits[2].chomp(".mp3")
    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)
    song = self.new(song_name, artist, genre)
    song
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
    song
  end

end
