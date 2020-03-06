class Genre
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
    @songs = []
    self.class.all << self
  end

  def save
    self.class.all << self
  end

  def self.create(name)
    song = self.new(name)
  end

  def add_song(song)
    song.genre = self if song.genre == nil
    @songs << song unless @songs.include?(song)
  end

  def artists
    self.songs.collect{|song| song.artist}.uniq
  end
end
