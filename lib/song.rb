class Song
  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def initialize(name,artist=nil,genre=nil)
    @name = name
    self.genre = genre
    self.artist = artist
    self.class.all << self
  end

  def save
    self.class.all << self
  end

  def self.create(name)
    song = self.new(name)
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self) unless artist == nil
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self) unless genre == nil
  end

  def self.find_by_name(name)
    self.all.each{|song| return song if song.name == name}
    return nil
  end

  def self.find_or_create_by_name(name)
    song = find_by_name(name)
    song == nil ? create(name) : song
  end

  def self.new_from_filename(filename)
    name = filename.split(" - ")[1]
    artist = Artist.find_or_create_by_name(filename.split(" - ")[0])
    genre = Genre.find_or_create_by_name(filename.split(" - ")[2].split('.')[0])
    Song.new(name, artist, genre)
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename)
  end
end
