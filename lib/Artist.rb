
class Artist
  extend Concerns::Findable
  
  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def save
    @@all << self
  end

  def add_song(song)
    song.artist = self unless song.artist
    @songs << song unless @songs.include?(song)
  end

  def genres
    self.songs.collect {|song| song.genre}.uniq
  end

  #class methods
  def self.create(name)
    artist_new = Artist.new(name)
    artist_new.save
    artist_new
  end

  def self.all
    @@all
  end

  def destroy_all
    @@all.clear
  end

end
