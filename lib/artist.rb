class Artist
  @@all = []
  attr_accessor :name, :songs
  def initialize(name)
    @name = name
    @songs = []
  end

  def genres
    genres = self.songs.collect {|song| song.genre}
    genres.uniq
  end

  def add_song(song)
    song.artist = self if song.artist.nil?
    @songs << song if !@songs.include?(song)
  end

  def self.create(name)
    new_artist = Artist.new(name)
    new_artist.save
    new_artist
  end

  def self.destroy_all
    self.all.clear
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

end
