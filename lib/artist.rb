class Artist

  extend Concerns::Findable

  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def save
    self.class.all << self
  end

  def songs
    @songs
  end

  def genres
    genres = songs.collect { |song| song.genre }
    genres.uniq
  end

  def add_song(song)
    if song.artist == nil
      song.artist = self
    end

    if !songs.include?(song)
      songs << song
    end
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def self.create(name)
    new_artist = self.new(name)
    new_artist.save
    new_artist
  end

end
