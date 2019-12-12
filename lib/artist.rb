class Artist
  extend Concerns::Findable

  attr_accessor :name, :song, :genre
  @@all = []

  def initialize(name)
    @name = name
    @song = song
    @genre = genre
    @songs = []
  end

  def self.all
    @@all
  end

  def songs
    @songs
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    artist = Artist.new(name)
    @@all << artist
    artist
  end

  def add_song(song)
    song.artist = self unless song.artist == self
    songs << song unless songs.include?(song)
  end

  def genres
    songs.collect do |song|
       song.genre
     end.uniq
   end

end
