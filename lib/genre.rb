class Genre

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

  def artists
    artists = songs.collect { |song| song.artist }
    artists.uniq
  end

  def add_song(song)
    if song.genre == nil
      song.genre = self
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
    new_genre = self.new(name)
    new_genre.save
    new_genre
  end

end
