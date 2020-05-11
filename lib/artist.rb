class Artist
  extend Concerns::Findable
  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.create(name)
    new(name).tap{|a| a.save}
  end

  def add_song(song)
    song.artist = self unless song.artist == self
    @songs << song unless @songs.include?(song)
  end

  def name
    @name
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

  def genres
    genres = @songs.collect do |song|
      song.genre
    end
    genres.uniq
  end
end
