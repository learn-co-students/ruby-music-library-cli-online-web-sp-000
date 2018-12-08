class Song

  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist
    self.genre = genre

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

  def self.create(name)
    music = self.new(name)
    music.save
    music
  end

  def artist=(artist)
    if artist != nil
      @artist = artist
      artist.add_song(self)
    end
  end

  def genre=(genre)
    if genre != nil && !genre.songs.include?(self)
      @genre = genre
      genre.songs << self
    end
  end

  def self.find_by_name(name)
    self.all.find {|object| object.name == name}
  end
end
