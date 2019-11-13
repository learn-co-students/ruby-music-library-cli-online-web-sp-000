class Song
  attr_accessor :name
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist= artist if artist
    self.genre= genre if genre
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
    song = self.new(song)
    song.save
    song
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
    if !(genre.songs.include?(self))
      genre.songs << self
    end
  end

  def self.find_by_name(name)
    all.detect{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end
end
