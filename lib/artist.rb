class Artist
  extend Concerns::Findable
  attr_accessor :name

  @@all = []

  def initialize(name = nil)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    self.new.tap do |artist|
      artist.name = name
      artist.save
    end
  end

  def songs
    @songs
  end

  def add_song(song)
    song.artist ||= self
    @songs << song unless @songs.include?(song)
  end

  def genres
    genres = @songs.map{|song| song.genre}
    genres.uniq
  end

end
