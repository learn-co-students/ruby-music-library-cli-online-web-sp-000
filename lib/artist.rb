class Artist

  @@all = []

  attr_accessor :name, :songs

  extend Concerns::Findable

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.create(name)
    artist = self.new(name)
    artist.save
    artist
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

  def songs
    @songs
  end

  def add_song(song)
    if song.artist == nil
      song.artist = self
      self.songs << song
    end
  end

  def genres
    self.songs.collect {|song| song.genre}.uniq
  end



end
