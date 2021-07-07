class Artist
  extend Concerns::Findable

  attr_accessor :name
  attr_reader :song
  
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
    artist = Artist.new(name)
    artist.save
    artist
  end

  def songs
    @songs
  end

  def add_song(song)
    song.artist == nil ? song.artist = self : nil
    if !self.songs.include?(song)
      self.songs << song
    end
  end
  
  def genres
    genres = self.songs.collect do |song|
      song.genre
    end
    genres.uniq
  end
end