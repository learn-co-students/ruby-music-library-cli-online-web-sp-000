class Song
  
  extend Concerns::Findable
  attr_accessor :name
  attr_reader :artist, :genre
  
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist != nil
    self.genre = genre if genre != nil
  end

  def artist= (artist)
    @artist = artist
    artist.add_song(self)
  end
  
  def genre= (genre)
    @genre = genre
    genre.add_song(self)
  end

  def self.all
    @@all
  end

  def save
    @@all << self
    self
  end

  def self.create(name)
    self.new(name).save
  end

  def self.destroy_all
    @@all.clear
  end

end
