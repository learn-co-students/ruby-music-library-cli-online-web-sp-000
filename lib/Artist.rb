class Artist
  extend Concerns::Findable

  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    save
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
    artist = Artist.new(name)
  end

  def songs
    Song.all.filter {|song| song.artist == self}
  end

  def add_song(song)
    song.artist = self if !song.artist
  end

  def genres
    self.songs.map {|song| song.genre}.uniq
  end
  
end