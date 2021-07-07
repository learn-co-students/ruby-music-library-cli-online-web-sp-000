class Song
  extend Concerns::Findable
  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def initialize(name = nil, artist = nil, genre = nil)
    @name = name
    self.artist = artist unless artist == nil
    self.genre = genre unless genre == nil
  end

  def self.all
    @@all
  end

  def self.destroy_all
    all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    self.new.tap do |song|
      song.name = name
      song.save
    end
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end

  def self.new_from_filename(filename)
    data = filename.split(/( - )|(\.)/)
    data.reject!{|s| s == " - " || s == "." || s == "mp3"}
    # data = [artist, title, genre]
    Song.new.tap do |song|
      song.name = data[1]
      song.artist = Artist.find_or_create_by_name(data[0])
      song.genre = Genre.find_or_create_by_name(data[2])
    end
  end

  def self.create_from_filename(filename)
    Song.new_from_filename(filename).tap do |song|
      song.save
    end
  end
end
