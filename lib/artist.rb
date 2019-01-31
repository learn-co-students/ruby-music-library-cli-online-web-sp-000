class Artist

  attr_accessor :name, :song

  @@all = []

  def initialize(name)
    @name = name
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.destroy_all
    self.all.clear
  end

  def self.create(artist_name)
    artist = Artist.new(artist_name)
    artist.save
    artist
  end

  def add_song(song)
    song.artist = self
  end
end
