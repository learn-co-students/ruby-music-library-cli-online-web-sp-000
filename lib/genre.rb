class Genre
  extend Concerns::Findable
  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name
    self.save
    @songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    genre = Genre.new(name)
  end

  def save
    @@all << self
  end

  def songs
    @songs
  end

  def add_song(song)
    song.genre = self if song.genre == nil
    @songs << song if @songs.none? {|song_1| song_1 == song}
  end

  def artists
    artists = []
    @songs.each {|song| artists << song.artist}
    artists.uniq
  end

end
