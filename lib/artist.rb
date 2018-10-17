

class Artist
  extend Concerns::Findable
  extend Persistable
  include Persistable

  attr_accessor :name, :artist, :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def self.all_sorted
    all.sort_by!{|artist| artist.name}
  end

  def songs
    @songs
  end

  def sorted_songs
    sorted_songs = @songs.sort_by!{|song| song.name}
    sorted_songs
  end

  def add_song(song)
    songs << song unless songs.include?(song)
    song.artist = (self) unless song.artist == self
  end

  def genres
    @songs.collect {|song| song.genre}.uniq
  end

  def self.create(name)
    artist = Artist.new(name)
    @@all << artist
    artist
  end

end
