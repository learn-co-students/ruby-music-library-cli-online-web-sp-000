class Artist
  attr_accessor :name, :songs
  attr_reader

  @@all = []

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def initialize(name)
    @name = name
    @songs = []
  end

  def save
    @@all << self
  end

  def self.create(name)
    #create an instance of said song
    artist = Artist.new(name)
    #save said instance
    artist.save
    artist
  end

  def add_song(song)
    song.artist = self if song.artist == nil
    @songs << song if !@songs.include?(song)
  end
end
