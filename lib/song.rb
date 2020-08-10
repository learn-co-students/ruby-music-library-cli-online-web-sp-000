class Song
  attr_accessor :name, :artist, :genre
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist unless artist == nil
    self.genre = genre unless genre == nil
    save
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

  def self.create(song)
    new_song = Song.new(song)
    new_song
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    self.genre.songs << self unless genre.songs.include?(self)
  end

  def self.find_by_name(name)
    self.all.detect {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    find_by_name(name) || create(name)
  end

  def self.new_from_filename(filename)
    title = filename.split(" - ")
    artist = Artist.find_or_create_by_name(title[0])
    genre = Genre.find_or_create_by_name(title[2][0..-5])
    Song.new(title[1], artist, genre)
  end

  def self.create_from_filename(filename)
    new_from_filename(filename)
  end

end
