class Artist
  extend Concerns::Findable

  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    @@all << self
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    song = self.new(name)
    song
  end

  def add_song(song)
    song.artist = self if song.artist == nil
    self.songs << song if !self.songs.include? song
  end

  def genres
    self.songs.map {|song| song.genre}.uniq
  end

end
