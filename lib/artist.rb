class Artist
  extend Concerns::Findable
  attr_accessor :name
  @@all = []
  def initialize(name)
    @name = name
    @songs = []
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
    artist = self.new(name)
    artist.save
    artist
  end

  def songs
    @songs
  end

  def add_song(song)
    song.artist = self if song.artist == nil
    self.songs << song if !self.songs.include?(song)
  end

  def genres
    @genres_array = []
    self.songs.each{|song| @genres_array.include?(song.genre) ? nil : @genres_array << song.genre}
    @genres_array
  end

end
