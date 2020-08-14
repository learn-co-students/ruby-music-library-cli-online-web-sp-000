# rspec spec/002_artist_basics_spec.rb

class Artist

  extend Concerns::Findable

  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    save
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

  def self.create(name)
    self.new(name)
  end

  def add_song(song)
    if song.artist == nil || song.artist == ""
      song.artist = self
    end
    if !self.songs.include?(song)
      self.songs << song
    end
  end

  def genres
    songs.map {|song| song.genre}
  end

end