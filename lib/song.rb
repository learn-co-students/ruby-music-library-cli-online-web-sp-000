class Song
  attr_accessor :name
  attr_reader :artist, :genre
  @@all = []

  def initialize (name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist != nil
    self.genre = genre if genre != nil
  end

  def self.new_from_filename (filename)
    filename_array = filename.split(" - ")
    Song.new(filename_array[1], Artist.find_or_create_by_name(filename_array[0]), Genre.find_or_create_by_name(filename_array[2].delete_suffix(".mp3")))
  end

  def self.create_from_filename (filename)
    new_song = self.new_from_filename(filename)
    self.all << new_song
    new_song
  end

  def self.find_by_name(name)
    self.all.detect{|s| s.name == name}
  end

  def self.find_or_create_by_name (name)
    self.find_by_name(name) || self.create(name)
  end

  def genre= (genre)
    @genre = genre
    genre.songs << self if !genre.songs.include?(self)
  end

  def artist= (artist)
    @artist = artist
    artist.add_song(self)
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

  def self.create (name)
    new_song = Song.new(name)
    new_song.save
    new_song
  end
end
