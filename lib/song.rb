class Song
  extend Concerns::Findable
  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end

  def self.create(name)
    new(name).tap {|s| s.save}
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self if !genre.songs.include?(self)
  end

  def self.new_from_filename(fileName)
    data = fileName.split(" - ")
    artist = Artist.find_or_create_by_name(data[0])
    genre = Genre.find_or_create_by_name(data[2].gsub(".mp3", ""))
    new(data[1], artist, genre)
  end

  def self.create_from_filename(fileName)
    new_from_filename(fileName).tap {|s| s.save}
  end

end
