class Song

  attr_accessor :name, :artist, :genre
  extend Concerns::Findable

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end

  def self.all
    @@all.sort_by {|song| song.name}
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    new_song = new(name)
    new_song.save
    new_song
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end

  def self.new_from_filename(filename)
  artist, song, genre = filename.chomp(".mp3").split(" - ")
  artist = Artist.find_or_create_by_name(artist)
  genre = Genre.find_or_create_by_name(genre)
  new_song = self.new(song, artist, genre)
  new_song
  end

  def self.create_from_filename(filename)
    Song.new_from_filename(filename).save
  end

end
