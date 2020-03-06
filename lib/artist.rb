class Artist
  attr_accessor :name, :songs

  extend Concerns::Findable

  @@all = []

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def initialize(name)
    @name = name
    self.class.all << self
    @songs = []
  end

  def save
    self.class.all << self
  end

  def self.create(name)
    song = self.new(name)
  end

  def add_song(song)
    song.artist = self if song.artist == nil
    @songs << song unless @songs.include?(song)
  end

  def genres
    self.songs.collect{|song| song.genre}.uniq
  end
end
