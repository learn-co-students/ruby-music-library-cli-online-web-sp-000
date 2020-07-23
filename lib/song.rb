class Song
  extend Concerns::Findable
  attr_accessor :name, :artist, :genre
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    @artist = artist
    @genre = genre
    self.artist = artist if artist != nil
    self.genre = genre if genre != nil
  end

  def self.all
    @@all
  end

  def artist=(artist)
    @artist = artist
    self.artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    self.genre.add_song(self)
  end

  def save
    @@all << self
  end

  def self.create(name, artist = nil)
    song = Song.new(name)
    song.save
    song
  end

  def self.destroy_all
    @@all.clear
  end

  def self.new_from_filename(file)
    file_info = file.gsub(".mp3", "").split(" - ")
    artist = Artist.find_or_create_by_name(file_info[0])
    title = file_info[1]
    genre = Genre.find_or_create_by_name(file_info[2])
    song = Song.new(title, artist, genre)
  end

  def self.create_from_filename(file)
    self.all << new_from_filename(file)
  end
end
