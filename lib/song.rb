class Song
  extend Concerns::Findable

  attr_accessor :name
  attr_reader :artist, :genre
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end

  def self.create(name)
    song = Song.new(name)
    song.save
    song
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.destroy_all
    @@all.clear
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    self.genre = genre unless self.genre == genre
    genre.songs << self unless genre.songs.include?(self)
  end

  def self.new_from_filename(filename)
    string = filename.chomp(".mp3").split(" - ")
    song = self.find_or_create_by_name(string[1])
    song.artist = Artist.find_or_create_by_name(string[0])
    song.genre = Genre.find_or_create_by_name(string[2])
    song
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
  end

end
